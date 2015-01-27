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
    return "Disc Number: " & my filterData((disc number of current track as string), "", false)
end tell