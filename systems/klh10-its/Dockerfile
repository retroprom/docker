
ARG BASE="retroprom/klh10"

FROM ${BASE}

ARG PDP10_ITS_GIT="https://github.com/PDP-10/its.git"
ARG PDP10_ITS_REV="master"

ENV KLH10_VARIANT="kl"

USER root
WORKDIR /sim

RUN git clone "${PDP10_ITS_GIT}" \
 && cd its \
 && git checkout "${PDP10_ITS_REV}" \
 && chown -R sim:sim /sim

USER sim

