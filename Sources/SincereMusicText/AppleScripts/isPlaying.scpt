tell application "Music"
  if player state is playing then
    return true
  else
    return false
  end if
end tell
