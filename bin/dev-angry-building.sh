#!/bin/bash

CONTAINERS=$(docker ps -q)
if [ -n "$CONTAINERS" ]; then
  docker stop $CONTAINERS
fi

cd ~/Projects/angry_building

osascript <<EOF
tell application "iTerm"
    activate
    if (count of windows) = 0 then
        set newWindow to (create window with default profile)
    else
        set newWindow to current window
    end if

    tell newWindow
        create tab with default profile
        tell current session
            write text "cd /Users/rstankov/Projects/angry_building"
        end tell
    end tell
end tell
EOF

bin/dev
