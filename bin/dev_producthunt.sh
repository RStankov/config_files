#!/bin/bash

docker stop $(docker ps -q)

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
            write text "cd /Users/rstankov/Projects/producthunt && bundle exec puma -C config/puma.rb -p 5051"
        end tell
    end tell

    tell application "System Events" to keystroke "t" using {command down}
    delay 0.2
    tell current session of newWindow
        write text "cd /Users/rstankov/Projects/producthunt/frontend && nvm use && RAILS_URL=http://localhost:5051 NODE_ENV=development nodemon server/index.ts"
    end tell

    tell application "System Events" to keystroke "t" using {command down}
    delay 0.2
    tell current session of newWindow
        write text "cd /Users/rstankov/Projects/producthunt/frontend && nvm use && concurrently \"yarn graphql:codegen --errors-only --watch\""
    end tell

    tell application "System Events" to keystroke "t" using {command down}
    delay 0.2
    tell current session of newWindow
        write text "cd /Users/rstankov/Projects/producthunt
    end tell
end tell
EOF
