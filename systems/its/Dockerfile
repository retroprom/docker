
ARG BASE="debian:stable"

# **** Common environment

FROM ${BASE} AS common

# ITS configuration
ARG ITS_CONFIG=""
ARG ITS_TARGET="klh10"
ARG ITS_GIT="https://github.com/PDP-10/its.git"
ARG ITS_REV="master"

# Package dependencies
ENV ITS_PKG_RUNTIME="ca-certificates dumb-init git-core libncurses5 libpcap0.8 libvdeplug2 vde2"
ENV ITS_PKG_BUILD="autoconf automake build-essential expect gcc libtool make libltdl-dev libncurses5-dev pkg-config libpcap-dev libvdeplug-dev"
ENV ITS_PKG_EXTRA="bridge-utils htop iproute2 less nano ncat procps psmisc telnet uml-utilities vim"

# Build configuration
ENV ITS_BUILD_CONFIG="--bindir=/bin ${ITS_CONFIG}"
ENV ITS_BUILD_TARGET="${ITS_TARGET}"
ENV ITS_BUILD_GIT="${ITS_GIT}"
ENV ITS_BUILD_REV="${ITS_REV}"

# Install runtime dependencies
RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install --yes --no-install-recommends ${ITS_PKG_RUNTIME} \
 && apt clean && rm -rf /var/lib/apt/lists/* \
 && adduser --system --group --home=/sim sim

# **** Build environment

FROM common as build

WORKDIR /build

# Install build dependencies and build KLH-10
RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install --yes --no-install-recommends ${ITS_PKG_BUILD} \
 && apt clean && rm -rf /var/lib/apt/lists/* \
 && git clone --depth 1 ${ITS_BUILD_GIT} its \
 && cd its \
 && git checkout ${ITS_BUILD_REV} \
 && make EMULATOR=${ITS_BUILD_TARGET}

# **** Final environment

FROM common

# Configure ITS launch
ENV ITS_OPTIONS="${ITS_TARGET}"

# Copy binaries from build environment
COPY --from=build /build/its /sim
RUN chown -R sim:sim /sim

# Install extra packages
RUN apt update \
 && DEBIAN_FRONTEND=noninteractive apt install --yes --no-install-recommends ${ITS_PKG_EXTRA} \
 && apt clean && rm -rf /var/lib/apt/lists/*

# Install start script
COPY run.sh /sim/run.sh
RUN chmod 755 /sim/run.sh

# Configure initial environment
USER sim
WORKDIR /sim
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "/sim/run.sh" ]
