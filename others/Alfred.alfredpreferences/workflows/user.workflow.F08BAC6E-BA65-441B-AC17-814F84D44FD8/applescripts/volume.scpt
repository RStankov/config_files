tell application "Spotify"
    set q to system attribute "q"
    try
        (q as number) div 1
            set sound volume to q
    on error
        return "The option '" & q & "' must be a number between 0 and 100."
    end try
end tell