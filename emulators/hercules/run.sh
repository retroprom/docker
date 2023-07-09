#!/bin/bash
#
# Launch script for Hercules
#

# Be strict
set -euo pipefail

# Configure from environment
export HERCULES_CONFIG="${HERCULES_CONFIG:-hercules.ini}"
export HERCULES_SCRIPT="${HERCULES_SCRIPT:-hercules.rc}"
export HERCULES_LOG="${HERCULES_LOG:-hercules.log}"

# Say something
echo "Starting Hercules..."

# Run the simulator
exec hercules -f "${HERCULES_CONFIG}" -r "${HERCULES_SCRIPT}" > "${HERCULES_LOG}"
