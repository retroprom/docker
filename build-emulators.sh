#!/usr/bin/env bash

# Be strict
set -euo pipefail

# Remember root directory
ROOT="$PWD"

# Configuration
BASE="debian:bookworm"
EMULATORS="craysim dynamips es40 gxemul hercules klh10 simh"

# Build each emulator
for emulator in ${EMULATORS}; do
	# Run the build
	docker build \
		-f emulators/${emulator}/Dockerfile.debian \
		-t retroprom/${emulator}:latest \
		--build-arg BASE=${BASE} \
		"$@" \
		emulators/${emulator}
done
