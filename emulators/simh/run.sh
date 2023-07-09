#!/bin/bash
#
# Launch script for SIMH
#

# Be strict
set -euo pipefail

# Configure from environment
export SIMH_SIMULATOR="${SIMH_SIMULATOR:-pdp11}"

# Execute the simulator
exec "${SIMH_SIMULATOR}" "${@}"
