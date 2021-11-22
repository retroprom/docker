#!/bin/bash

IMAGES="simh-pdp10 simh-pdp11 simh-vax650 simh-vax780 simh-vax860"

time docker build . \
     --network host \
     -f Dockerfile.simh-base-alpine \
     -t "simh-base:alpine-latest" \
     "$@"

for image in ${IMAGES}; do
    time docker build . \
	 --network none \
	 -f Dockerfile.${image}-alpine \
	 -t "${image}:alpine" -t "${image}:alpine-latest"\
	 "$@"
done
