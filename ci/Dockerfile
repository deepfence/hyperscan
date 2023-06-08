FROM debian:bullseye-slim as build

# TODO(tjonak): I'm pretty certain some of those are unnecessary.
RUN apt-get update \
    && apt-get install -y \
    bash \
    build-essential \
    make \
    cmake \
    libaudit-dev \
    libcap-dev \
    git \
    gcc \
    libpcap-dev* \
    unzip \
    libc-dev \
    lsb-release \
    software-properties-common \
    libz-dev \
    apt-utils \
    protobuf-compiler \
    libboost-all-dev \
    libssl-dev \
    ragel \
    musl-dev \
    wget \
    curl \
    musl-tools

RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 16
RUN apt-get install -y libpolly-16-dev

COPY . /src/hyperscan
WORKDIR /src/hyperscan

RUN mkdir -p build && \
    cd build && \
    cmake ../ -DCMAKE_BUILD_TYPE=RELWITHDEBINFO && \
    make -j$(nproc)

FROM debian:bullseye-slim

COPY --from=build /src/hyperscan/build/lib/libhs.a /usr/local/hyperscan/lib/libhs.a
ENV HYPERSCAN_ROOT=/usr/local/hyperscan
