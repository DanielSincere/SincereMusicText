enum AppleMusicState: CustomStringConvertible {
  case paused
  case playing(artist: String, track: String)
  
  var description: String {
    switch self {
    case .paused:
      return "Music paused"
    case .playing(artist: let artist, track: let track):
      return "\(artist): \(track)"
    }
  }
}

