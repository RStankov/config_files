tell application "Spotify"
    set track_id to id of current track
    set AppleScript's text item delimiters to ":"
    set track_id to third text item of track_id
    set AppleScript's text item delimiters to ""
    set real_url to "http://open.spotify.com/track/" & track_id
    set the clipboard to real_url
    return "URL: " & real_url
end tell