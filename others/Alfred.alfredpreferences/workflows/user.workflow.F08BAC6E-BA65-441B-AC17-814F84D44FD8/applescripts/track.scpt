on filterData(s, prepend, empty)
    if s is missing value or s is equal to "" or s is equal to "0" then
        if empty is true then
            return ""
        else
            return "Not Found"
        end if
    else
        return prepend & s
    end if
end filterData

tell application "Spotify"
    set num to my filterData((track number of current track as string), "", true)
    if num is not equal to "" then
        set num to " (#" & num & ")"
    end if

    return "Current Track" & num & ": " & name of current track
end tell