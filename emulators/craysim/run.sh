#!/bin/bash
#
# Launch script for CraySim
#

# Be strict
set -euo pipefail

# Set PATH
export PATH="/sim/craysim/simulator/_bin/linux_release:${PATH}"

# Configure from environment
export CRAYSIM_CFG="${CRAYSIM_CFG:-craysim.cfg}"

# Change directory
cd /sim/craysim

# Execute the simulator
exec cray_sim "${CRAYSIM_CFG}"
