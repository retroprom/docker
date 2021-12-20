#!/bin/bash

IMAGES="simh-pdp10 simh-pdp11 simh-vax650 simh-vax780 simh-vax860"

#time docker build . \
#     --network host \
#     -f Dockerfile.simh-alpine \
#     -t "simh:alpine" \
#     "$@"

time docker build . \
     --network host \
     -f Dockerfile.simh-debian \
     -t "simh:debian" \
     "$@"
