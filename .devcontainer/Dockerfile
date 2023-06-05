FROM mcr.microsoft.com/devcontainers/base:bullseye

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
    gdb \
    musl-tools

RUN <<EOF
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
./llvm.sh 16
EOF
RUN apt-get install -y libpolly-16-dev

COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup install stable
RUN rustup install nightly
RUN rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
RUN rustup target add x86_64-unknown-linux-musl
USER vscode
ENV HYPERSCAN_ROOT=/usr/local/hyperscan
ENV PATH="/root/.cargo/bin:${PATH}"

# RUN <<EOF
# set -e
# mkdir -p /home/vscode/.docker/cli-plugins
# curl -sfLo docker-buildx https://github.com/docker/buildx/releases/download/v0.10.5/buildx-v0.10.5.linux-amd64
# mv docker-buildx /home/vscode/.docker/cli-plugins
# chown vscode:vscode /home/vscode/.docker/cli-plugins/docker-buildx
# chmod u+x /home/vscode/.docker/cli-plugins/docker-buildx
# EOF
