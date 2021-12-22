#!/bin/bash

#time docker build . \
#     --network host \
#     -f Dockerfile.simx-alpine \
#     -t "retro-simx:alpine" \
#     "$@"

time docker build . \
     --network host \
     -f Dockerfile.simx-debian \
     -t "retro-simx:debian" \
     "$@"
