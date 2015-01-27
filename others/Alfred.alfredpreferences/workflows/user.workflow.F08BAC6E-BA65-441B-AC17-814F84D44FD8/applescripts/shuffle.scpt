tell application "Spotify"
    if shuffling enabled is true then
        if shuffling is true then
            set shuffling to false
        else
            set shuffling to true
        end if
    else
        return "Shuffling is not currently enabled."
    end if
end tell