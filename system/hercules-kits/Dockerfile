
ARG BASE="retroprom/hercules:latest"

FROM ${BASE}

USER root

ADD / /sim/

RUN chown -R sim:sim /sim/

USER sim
WORKDIR /sim
CMD [ "/sim/tmux.sh" ]
