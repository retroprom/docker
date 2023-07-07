#!/bin/bash
set -e
# Loop while the session exists
while tmux has-session -t "${TMUX_SESSION}"; do
    # Clear the screen for look-and-feel
    clear
    # Run the called-for command
    "$@"
    # Check the session, terminate if absent
    tmux has-session -t "${TMUX_SESSION}"
    # Note program termination
    echo "\nPROCESS TERMINATED - RESTARTING\n"
    # Dampen restarts
    sleep 5
done
