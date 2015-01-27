to calcTime(t)
    set m to (t div 60 as string)
    set s to t mod 60

    if s is less than 10 then
        set s to "0" & (s as string)
    else
        set s to (s as string)
    end if

    return m & ":" & s
end calcTime

tell application "Spotify"
    return "Duration: " & my calcTime(duration of current track)
end tell