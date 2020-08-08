FROM com.github.theflow0.psp_toolchain:latest

WORKDIR /root

RUN apt update \
    && apt full-upgrade -y

COPY ./scripts scripts
RUN chmod +x scripts/*.sh

RUN scripts/build_psp-packer.sh
RUN scripts/build_vdpm.sh
RUN scripts/build_vita-shader-collection.sh
RUN scripts/build_vita2dlib.sh
RUN rm -rf scripts

WORKDIR /root/Adrenaline