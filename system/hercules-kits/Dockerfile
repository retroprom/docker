
ARG BASE="retroprom/hercules:latest"

FROM ${BASE}

USER root

COPY / /sim/

RUN chown -R sim:sim /sim/

USER sim
WORKDIR /sim
