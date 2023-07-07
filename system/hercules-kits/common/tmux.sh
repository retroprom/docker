#!/bin/bash
set -e
# Default values
if [ -z "${TMUX_SESSION}" ]; then export TMUX_SESSION="main"; fi
if [ -z "${TMUX_PROGRAM}" ]; then export TMUX_PROGRAM="/sim/run.sh"; fi
if [ -z "${TMUX_CONFIG}" ]; then export TMUX_CONFIG="/sim/tmux.conf"; fi
if [ -z "${TMUX_DEFAULTS}" ]; then export TMUX_DEFAULTS="/sim/tmux.defs"; fi
if [ -z "${TMUX_WIDTH}" ]; then export TMUX_WIDTH="80"; fi
if [ -z "${TMUX_HEIGHT}" ]; then export TMUX_HEIGHT="25"; fi
# Generate startup script
START="${HOME}/.tmux.${TMUX_SESSION}.start"
cat > "${START}" <<EOF
new-session -s "${TMUX_SESSION}" -x ${TMUX_WIDTH} -y ${TMUX_HEIGHT} -n sim '/sim/tmux_main.sh ${TMUX_PROGRAM}'
source-file "${TMUX_DEFAULTS}"
source-file "${TMUX_CONFIG}"
select-window -t 0
EOF
# Check if the session exists
if ! tmux has-session -t "${TMUX_SESSION}"; then
  # Try to create the session
  if ! tmux source-file "${START}"; then
    # Must start a whole new server
    tmux -f "${START}" start-server
  fi
fi
# Check again, fail if we could not create it
if ! tmux has-session -t "${TMUX_SESSION}"; then
    echo "ERROR starting tmux session, tried:"
    cat "${START}"
    exit 1
fi
# Remove the start file
rm -f "${START}"
# Check if we are on a terminal
if [ -t 1 ]; then
    # If yes: attach the session, exit on detach or error
    tmux attach -t "${TMUX_SESSION}"
else
    # If no: wait for the session to terminate
    echo "TMUX session is running in the background"
    while tmux has-session -t "${TMUX_SESSION}"; do
        sleep 10
    done
    tmux kill-session -t "${TMUX_SESSION}" || true
    echo "TMUX session has terminated"
fi
