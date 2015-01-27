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
    set arr to my filterData(artist of current track, "", false)
    set album_arr to my filterData(album artist of current track, "", true)
    if arr is equal to album_arr or album_arr is equal to "" then
        return "Artist: " & arr
    else
        return "Artist: " & arr & " Album Artist: " & album_arr
    end if
end tell