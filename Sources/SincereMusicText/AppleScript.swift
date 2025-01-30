import Foundation

final class AppleScript {
  private let script: NSAppleScript
  
  init(source: String) throws {
    guard let script = NSAppleScript(source: source) else {
      throw AppleScriptInitializationError()
    }
    
    var errorDict: NSDictionary?
    let success = script.compileAndReturnError(&errorDict)
    if let errorDict {
      throw AppleScriptError(nsdictionary: errorDict)
    }
    guard success else {
      throw AppleScriptCompilationError()
    }
    
    self.script = script
  }
  
  func run() throws -> NSAppleEventDescriptor {
    var errorDict: NSDictionary?
    let result = self.script.executeAndReturnError(&errorDict)
    if let errorDict {
      throw AppleScriptError(nsdictionary: errorDict)
    }
    return result
  }
  
  func callAsFunction() throws -> String? {
    try self.run().stringValue
  }
  
  func callAsFunction() throws -> Bool {
    try self.run().booleanValue
  }
  
  struct AppleScriptInitializationError: LocalizedError {
    let errorDescription: String? = "Unexpectedly got `nil` when initializing an NSAppleScript object"
  }
  
  struct AppleScriptCompilationError: LocalizedError {
    let errorDescription: String? = "Unexpectedly didn't compile an NSAppleScript object"
  }
}
