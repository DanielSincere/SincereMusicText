import Foundation

public final class AppleScript {

  private let script: NSAppleScript

  public init(source: String) throws {
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

  public convenience init(_ bytes: [UInt8]) throws {
    guard let source = String(data: Data(bytes), encoding: .utf8) else {
      throw AppleScriptResourceError()
    }
    try self.init(source: source)
  }
  
  public func run() throws -> NSAppleEventDescriptor {
    var errorDict: NSDictionary?
    let result = self.script.executeAndReturnError(&errorDict)
    if let errorDict {
      throw AppleScriptError(nsdictionary: errorDict)
    }
    return result
  }
  
  public func callAsFunction() throws -> String? {
    try self.run().stringValue
  }
  
  public func callAsFunction() throws -> Bool {
    try self.run().booleanValue
  }

  public func callAsFunction() throws -> Int32 {
    try self.run().int32Value
  }
  
  public struct AppleScriptInitializationError: LocalizedError {
    public let errorDescription: String? = "Unexpectedly got `nil` when initializing an NSAppleScript object"
  }
  
  public struct AppleScriptResourceError: LocalizedError {
    public let errorDescription: String? = "Unexpectedly got `nil` when opening a script resource"
  }
  
  public struct AppleScriptCompilationError: LocalizedError {
    public let errorDescription: String? = "Unexpectedly didn't compile an NSAppleScript object"
  }
}
