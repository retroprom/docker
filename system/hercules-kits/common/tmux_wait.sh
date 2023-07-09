#!/bin/bash
#
# Script for TMUX panels that wait for main program startup
#

# Be strict
set -euo pipefail

# Tell the user that we are waiting
echo "\nWAITING FOR SIMULATOR\n"
# Wait for the ready event
tmux wait-for "sim-ready"
# Clear the terminal for a clean look
clear
# Exec as the child (not a subprocess)
exec "$@"
