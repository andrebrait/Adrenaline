FROM debian:10.5-slim

RUN apt update \
    && apt full-upgrade -y \
    && apt install -y \
        build-essential \
        flex \
        bison \
        cmake \
        git \
        curl \
        wget \
        jq \
        sudo \
        python \
        gcc-arm-linux-gnueabihf \
        qemu-user-static \
        zlib1g-dev

ENV PSPDEV "/usr/local/pspdev"
ENV PATH "${PATH}:${PSPDEV}/bin"
ENV VITASDK "/usr/local/vitasdk"
ENV PATH "${VITASDK}/bin:${PATH}"

WORKDIR /root 
COPY ./scripts/utils.sh scripts/utils.sh

# Putting in a separate layer because this downloads a lot of stuff
COPY ./scripts/psp_scripts scripts/psp_scripts
RUN chmod +x scripts/psp_scripts/*.sh \
    && scripts/psp_scripts/build_pspdev.sh \
    && scripts/psp_scripts/build_psp-packer.sh

# Putting in a separate layer because this downloads a lot of stuff
COPY ./scripts/vita_scripts/build_vdpm.sh scripts/vita_scripts/build_vdpm.sh
RUN chmod +x scripts/vita_scripts/build_vdpm.sh \
    && scripts/vita_scripts/build_vdpm.sh

COPY ./scripts/vita_scripts scripts/vita_scripts
RUN chmod +x scripts/vita_scripts/*.sh \
    && scripts/vita_scripts/build_vita-shader-collection.sh \
    && scripts/vita_scripts/build_vita2dlib.sh \
    && rm -rf scripts \
    && apt remove -y \
        git \
        curl \
        wget \
        jq \
        python \
        gcc-arm-linux-gnueabihf \
        qemu-user-static \
        zlib1g-dev \
    && apt autoremove -y