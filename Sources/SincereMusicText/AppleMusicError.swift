import Foundation

struct AppleScriptError: LocalizedError {
  let dict: Dictionary<String, String>
  var errorDescription: String? {
    return "\(dict)"
  }
  init(dict: Dictionary<String, String>) {
    self.dict = dict
  }
  init(nsdict: NSDictionary) {
    self.dict = Dictionary(uniqueKeysWithValues: nsdict.allKeys.map { key in
      (String(describing: key), String(describing: nsdict[key]))
    })
  }
}
