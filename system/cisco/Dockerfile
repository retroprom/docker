
ARG BASE="retroprom/emulator-dynamips"

FROM ${BASE}

ARG OPTIONS="-P 7200"
ARG IMAGE="c7200-jk9s-mz.124-13b.bin"

ENV DYNAMIPS_IMAGE="${IMAGE}"
ENV DYNAMIPS_OPTIONS="${OPTIONS}"

WORKDIR /sim
COPY *.bin /sim/
COPY *.md5 /sim/
RUN chown -R sim.sim /sim && chmod 755 run.sh

USER sim
WORKDIR /sim
CMD ./run.sh
