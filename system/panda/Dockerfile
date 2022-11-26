
ARG BASE="retroprom/emulator-klh10"

FROM ${BASE}

WORKDIR /sim

COPY RH20.RP07.1 .
COPY boot.sav .
COPY klt20.ini .
RUN chown -R sim.sim /sim
RUN cp -r /opt/klh10-kl/bin/* .

USER sim

