
ARG BASE="retroprom/emulator-simh"

FROM ${BASE}

COPY * /sim/
RUN chown -R sim.sim /sim

USER sim
WORKDIR /sim

