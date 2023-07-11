#!/bin/bash
#
# Launch script for ITS
#

# Be strict
set -euo pipefail

# Execute the emulator
exec ./start "${ITS_OPTIONS}"
