#!/bin/bash

IMAGES="alpine-simh-pdp10 alpine-simh-pdp11 alpine-simh-vax650 alpine-simh-vax780 alpine-simh-vax860"

TAG="alpine-latest"

time docker build . -f Dockerfile.simh-base -t "simh-base:${TAG}" --network host "$@"

for image in ${IMAGES}; do
    time docker build . \
	 -f Dockerfile.${image} \
	 -t "${images}:${TAG}" \
	 --network none "$@"
done
