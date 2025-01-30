public enum AppleMusicState: CustomStringConvertible {
  
  case paused
  case playing(artist: String?, track: String?, album: String?)
  
  public var description: String {
    switch self {
    case .paused:
      return "Music paused"
    case .playing(artist: let artist, track: let track, let album):
      if let artist, let track, let album {
        return "\(artist): \(track) [\(album)]"
      } else if let artist, let track {
        return "\(artist): \(track)"
      } else if let track {
        return "\"\(track)\""
      } else {
        return "Playing something, there's no info what it is"
      }
    }
  }
}
