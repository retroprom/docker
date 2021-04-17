#!/bin/sh

IMAGES="alpine-simh-base alpine-simh-pdp10 alpine-simh-pdp11 alpine-simh-vax650 alpine-simh-vax780 alpine-simh-vax860"

for image in ${IMAGES}; do
	time docker build . -f Dockerfile-${image} -t ${image} --network default
done

