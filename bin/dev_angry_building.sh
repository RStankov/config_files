#!/bin/bash

CONTAINERS=$(docker ps -q)
if [ -n "$CONTAINERS" ]; then
  docker stop $CONTAINERS
fi

cd ~/Projects/angry_building

bin/dev
