#!/bin/bash
#
# Script for the main panel of a TMUX session
#
# The child of this main panel will dictate the lifetime of both
# the session and its corresponding launch script and service.
#
# This is achieve by simply launching the child, ignoring errors,
# and killing the session explicitly when the child terminates.
#

# Be strict
set -euo pipefail

# Launch child (ignore errors)
"$@" || true

# Kill the session
tmux kill-session -t "${TMUX_SESSION}"
