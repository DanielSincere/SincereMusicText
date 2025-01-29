import Foundation

class AppleMusic {

  func current() throws -> AppleMusicState {
    if try self.isPlaying() {
      return try .playing(artist: artistName(), track: trackName())
    } else {
      return .paused
    }
  }
  
  func trackName() throws -> String {
    var errorDict: NSDictionary?
    let result = getTrackScript.executeAndReturnError(&errorDict)
    if let errorDict {
      throw AppleScriptError(nsdict: errorDict)
    }
    
    return result.stringValue ?? "<missing song name>"
  }
  
  func artistName() throws -> String {
    var errorDict: NSDictionary?
    let result = getArtistScript.executeAndReturnError(&errorDict)
    if let errorDict {
      throw AppleScriptError(nsdict: errorDict)
    }
    
    return result.stringValue ?? "<missing artist name>"
  }
  
  func isPlaying() throws -> Bool {
    var errorDict: NSDictionary?
    let result = getPlayingScript.executeAndReturnError(&errorDict)
    if let errorDict {
      throw AppleScriptError(nsdict: errorDict)
    }
    
    return result.booleanValue
  }
  

  
  let getPlayingScript: NSAppleScript = {
    let script = NSAppleScript(source: """
        tell application "Music"
          if player state is playing then
            return true
          else
            return false
          end if
        end tell      
        """
    )!
    var errorDict: NSDictionary?
    let success = script.compileAndReturnError(&errorDict)
    if let errorDict {
      print("error", errorDict)
    }
    assert(success)
    return script
  }()
  
  let getArtistScript: NSAppleScript = {
    let script = NSAppleScript(source: """
        tell application "Music"
          set this_artist to artist of current track
          return this_artist
        end tell      
        """
    )!
    var errorDict: NSDictionary?
    let success = script.compileAndReturnError(&errorDict)
    if let errorDict {
      print("error", errorDict)
    }
    assert(success)
    return script
  }()
  
  let getTrackScript: NSAppleScript = {
    let script = NSAppleScript(source: """
        tell application "Music"
          set this_track to name of current track
          return this_track
        end tell      
        """
    )!
    var errorDict: NSDictionary?
    let success = script.compileAndReturnError(&errorDict)
    if let errorDict {
      print("error", errorDict)
    }
    assert(success)
    return script
  }()
}
