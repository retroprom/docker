
ARG BASE="retroprom/klh10"

FROM ${BASE}

ENV KLH10_VARIANT="kl"
ENV KLH10_STARTUP="klt20.ini"

USER root
WORKDIR /sim

COPY RH20.RP07.1 .
COPY boot.sav .
COPY klt20.ini .

RUN chown -R sim:sim /sim

USER sim
