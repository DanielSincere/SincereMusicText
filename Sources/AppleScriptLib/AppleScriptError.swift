import Foundation

public struct AppleScriptError: LocalizedError {
  public let info: Dictionary<String, String>
  public var errorDescription: String? {
    return "\(info)"
  }
  
  init(info: Dictionary<String, String>) {
    self.info = info
  }
  
  init(nsdictionary: NSDictionary) {
    self.info = Dictionary(uniqueKeysWithValues: nsdictionary.allKeys.map { key in
      (String(describing: key), String(describing: nsdictionary[key]))
    })
  }
}
