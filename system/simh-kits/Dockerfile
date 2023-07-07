
ARG BASE="retroprom/simh:latest"

FROM ${BASE}

ARG SIMULATOR="pdp11"

# Override simulator
ENV SIMH_SIMULATOR="${SIMULATOR}"

# Deploy provided files
COPY * /sim/
USER root
RUN chown -R sim:sim /sim

# Run as a user
USER sim
WORKDIR /sim

# Use dumb-init and start our script
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/sim/run.sh" ]

