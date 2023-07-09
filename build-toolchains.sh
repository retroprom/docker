#!/usr/bin/env bash

# Be strict
set -euo pipefail

# Remember root directory
ROOT="$PWD"

# Configuration
BASE="debian:bookworm"
TOOLCHAINS="i370"

# i370 / mvscross
docker build \
	-f toolchains/i370/Dockerfile.debian \
	-t retroprom/toolchain-i370:latest \
	--build-arg BASE=retroprom/hercules-mvs-ce:latest \
	--build-arg START=/sim/tmux.sh \
	"$@" \
	toolchains/i370

