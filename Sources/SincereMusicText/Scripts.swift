enum Scripts {

  static let isPlaying = """
    tell application "Music"
      if player state is playing then
        return true
      else
        return false
      end if
    end tell   
    """
  
  static let artist = """
    tell application "Music"
    set this_artist to artist of current track
    return this_artist
    end tell
    """
  
  static let songName = """
    tell application "Music"
    set this_track to name of current track
    return this_track
    end tell
    """
}
