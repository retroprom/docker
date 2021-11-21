#!/bin/sh

IMAGES="alpine-hyperion"

for image in ${IMAGES}; do
	time docker build . -f Dockerfile.${image} -t ${image} --network default
done

