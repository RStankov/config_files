#!/bin/bash

docker stop $(docker ps -q)

cd ~/Projects/angry_building

bin/dev
