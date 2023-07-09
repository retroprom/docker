#!/bin/bash
#
# Launch script for ITS
#

# Be strict
set -euo pipefail

# Must run in build directory
cd its

# Execute the emulator
exec ./start "${ITS_OPTIONS}"
