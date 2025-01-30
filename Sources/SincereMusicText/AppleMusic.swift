import Foundation

class AppleMusic {
  
  let isPlaying: AppleScript
  let artist: AppleScript
  let songName: AppleScript
  init() throws {
    self.isPlaying = try AppleScript(source: Scripts.isPlaying)
    self.artist = try AppleScript(source: Scripts.artist)
    self.songName = try AppleScript(source: Scripts.songName)
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
