import Foundation
import AppleScriptLib

class AppleMusic {
  
  let isPlaying: AppleScript
  let artist: AppleScript
  let songName: AppleScript
  
  init() throws {
    self.isPlaying = try AppleScript(PackageResources.isPlaying_scpt)
    self.artist = try AppleScript(PackageResources.artistName_scpt)
    self.songName = try AppleScript(PackageResources.songName_scpt)
  }
  
  func current() throws -> AppleMusicState {
    if try self.isPlaying() {
      return try .playing(artist: self.artist() ?? "<missing artist name>",
                          track: self.songName() ?? "<missing song name>")
    } else {
      return .paused
    }
  }
}
