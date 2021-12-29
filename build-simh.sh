#!/bin/bash

#time docker build . \
#     --network host \
#     -f Dockerfile.simh-alpine \
#     -t "retro-simh:alpine" \
#     "$@"

time docker build . \
     --network host \
     -f Dockerfile.simh-debian \
     -t "retro-simh:debian" \
     "$@"
