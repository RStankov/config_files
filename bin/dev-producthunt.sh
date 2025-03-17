#!/bin/bash

CONTAINERS=$(docker ps -q)
if [ -n "$CONTAINERS" ]; then
  docker stop $CONTAINERS
fi

cd /Users/rstankov/Projects/producthunt

docker-compose up -d --no-recreate

osascript <<EOF
tell application "iTerm2"
    # Create a new window or use existing one
    if (count of windows) = 0 then
        create window with default profile
    end if

    # Get the current window
    set currentWindow to current window

    # First tab
    tell currentWindow
        create tab with default profile
        tell current session
            write text "cd /Users/rstankov/Projects/producthunt && bundle exec puma -C config/puma.rb -p 5051"
        end tell
    end tell

    # Second tab
    tell currentWindow
        create tab with default profile
        tell current session
            write text "cd /Users/rstankov/Projects/producthunt/frontend && nvm use && RAILS_URL=http://localhost:5051 NODE_ENV=development nodemon server/index.ts"
        end tell
    end tell

    # Third tab
    tell currentWindow
        create tab with default profile
        tell current session
            write text "cd /Users/rstankov/Projects/producthunt/frontend && nvm use && concurrently \"yarn graphql:codegen --errors-only --watch\""
        end tell
    end tell

    # Fourth tab
    tell currentWindow
        create tab with default profile
        tell current session
            write text "cd /Users/rstankov/Projects/producthunt"
        end tell
    end tell
end tell
EOF
