#!/bin/bash
#
# Start script for TMUX sessions
#
# This script can start a TMUX session in various situations
# including command-line use, interactive Docker launches and
# background launches in containers or as a service.
#
# The script will stay in the foreground so that containers
# and service managers can treat it as a blocking child.
#
# TMUX session naming should prevent duplicate session in
# most cases, but this is not safe. Care must therefore
# be taken not to use this script concurrently, which is
# already the case for container and service launches.
# 

# Be strict
set -euo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

# Switch to sim directory
SELF="$(type -p "$0")"
ROOT="$(dirname "${SELF}")"
cd "${ROOT}"

# Configure from environment
export TMUX_SESSION="${TMUX_SESSION:-main}"
export TMUX_PROGRAM="${TMUX_PROGRAM:-/sim/run.sh}"
export TMUX_CONFIG="${TMUX_CONFIG:-/sim/tmux.conf}"
export TMUX_DEFAULTS="${TMUX_DEFAULTS:-/sim/tmux.defaults}"
export TMUX_WIDTH="${TMUX_WIDTH:-80}"
export TMUX_HEIGHT="${TMUX_HEIGHT:-25}"

# Generate startup script
START="${HOME}/.tmux.${TMUX_SESSION}.start"
cat > "${START}" <<EOF
new-session -s "${TMUX_SESSION}" -x ${TMUX_WIDTH} -y ${TMUX_HEIGHT} -n sim '/sim/tmux_main.sh ${TMUX_PROGRAM}'
source-file "${TMUX_DEFAULTS}"
source-file "${TMUX_CONFIG}"
select-window -t 0
EOF

# Helper function for checking the session
session_is_alive() {
  echo CHECK SESSION
  tmux has-session -t "${TMUX_SESSION}" "$@"
}

# Check if the session exists
if ! session_is_alive; then
  # Try to create the session in a pre-existing server
  echo LAUNCH A
  if ! tmux source-file "${START}"; then
    # Try again without a pre-existing server
    echo LAUNCH B
    tmux -f "${START}" start-server
  fi
fi

# Check again, fail if we could not create it
if ! session_is_alive; then
    echo "ERROR starting TMUX session, tried:"
    cat "${START}"
    exit 1
fi

# Remove the start file
rm -f "${START}"

# Check if we are on a terminal
if [ -t 1 ]; then
    # If yes: attach the session, exit on error
    echo "ATTACH"
    tmux attach -t "${TMUX_SESSION}" || exit 1
fi

# Tell the user about backgrounding
if session_is_alive; then
    echo "TMUX session is running in the background"
fi

# Wait for the session to terminate
while session_is_alive; do
    sleep 3
done

# Tear the session down if we get terminated
tmux kill-session -t "${TMUX_SESSION}" || true
echo "TMUX session has terminated"
