import Foundation
import AppleScriptLib

public class AppleMusic {
  
  let isPlaying: AppleScript
  let artist: AppleScript
  let songName: AppleScript
  let albumName: AppleScript
  
  public init() throws {
    self.isPlaying = try AppleScript(PackageResources.isPlaying_scpt)
    self.artist = try AppleScript(PackageResources.artistName_scpt)
    self.songName = try AppleScript(PackageResources.songName_scpt)
    self.albumName = try AppleScript(PackageResources.albumName_scpt)
  }
  
  public func currentState() throws -> AppleMusicState {
    if try self.isPlaying() {
      return try .playing(artist: self.artist(),
                          track: self.songName(),
                          album: self.albumName())
    } else {
      return .paused
    }
  }
}
