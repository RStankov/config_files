tell application "Spotify"
    if repeating enabled is true then
        if repeating is true then
            set repeating to false
        else
            set repeating to true
        end if
    else
        return "Repeating is not currently enabled."
    end if
end tell