#!/usr/bin/env bash

set -e

ROOT=$PWD

BASE="debian:bullseye"
EMULATORS="dynamips es40 gxemul hercules klh10 simh"

for emulator in ${EMULATORS}; do
	docker build \
		-f emulator/${emulator}/Dockerfile.debian \
		-t retroprom/${emulator}:latest \
		--build-arg BASE=${BASE} \
		"$@" \
		emulator/${emulator}
done
