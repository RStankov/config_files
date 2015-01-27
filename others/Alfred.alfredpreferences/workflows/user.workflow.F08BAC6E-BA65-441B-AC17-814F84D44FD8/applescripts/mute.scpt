tell application "Spotify"
    if sound volume is less than or equal to 0 then
        set sound volume to 100
    else
        set sound volume to 0
    end if
end tell