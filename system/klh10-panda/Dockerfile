
ARG BASE="retroprom/klh10"

FROM ${BASE}

WORKDIR /sim

COPY RH20.RP07.1 .
COPY boot.sav .
COPY klt20.ini .
COPY run.sh .
RUN chown -R sim.sim /sim
RUN chmod 755 run.sh
RUN cp -r /opt/klh10-kl/bin/* .

USER sim
CMD ./run.sh

