#!/bin/bash

# Get rid of dangling images
dangling=$(docker images -f "dangling=true" -q)
if [ ! -z "${dangling}" ]; then
    docker rmi -f  ${dangling}
fi

# Build with make
make .build/app.dev

# Start application
docker-compose -f docker-compose.dev.yml up
