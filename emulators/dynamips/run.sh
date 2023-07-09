#!/bin/bash
#
# Launch script for Dynamips
#

# Be strict
set -euo pipefail

# Run the simulator
exec dynamips ${DYNAMIPS_OPTIONS} ${DYNAMIPS_IMAGE}
