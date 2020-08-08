FROM debian:buster-slim

WORKDIR /root

RUN apt update \
    && apt full-upgrade -y \
    && apt install -y \
        build-essential \
        binutils \
        flex \
        bison \
        cmake \
        git \
        curl \
        wget \
        sudo \
        python \
        gcc-arm-linux-gnueabihf \
        qemu-user-static

# putting this in its own layer because it's quite big!
COPY ./scripts scripts
RUN chmod +x scripts/build_psptoolchain.sh \
    && scripts/build_psptoolchain.sh \
    && rm -rf scripts