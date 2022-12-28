
ARG BASE="retroprom/simh:latest"

FROM ${BASE}

# Deploy provided files
COPY * /sim/
RUN chown -R sim.sim /sim

# Run as a user
USER sim
WORKDIR /sim

# Use dumb-init
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

# Start using run script
CMD [ "/sim/run.sh" ]

