FROM com.github.theflow0.psp_toolchain:latest

WORKDIR /root

RUN apt update \
    && apt full-upgrade -y

COPY ./scripts scripts
RUN chmod +x scripts/*.sh \
    && scripts/build_psp-packer.sh \
    && scripts/build_vdpm.sh \
    && scripts/build_vita-shader-collection.sh \
    && scripts/build_vita2dlib.sh \
    && rm -rf scripts

WORKDIR /root/Adrenaline