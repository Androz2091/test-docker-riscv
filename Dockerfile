FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libslirp-dev

WORKDIR /tmp/

RUN git clone https://github.com/riscv/riscv-gnu-toolchain

WORKDIR /tmp/riscv-gnu-toolchain

RUN ./configure --prefix=/opt/riscv

RUN make

RUN export PATH=$PATH:/opt/riscv/bin

RUN rm -rf /tmp/riscv-gnu-toolchain

CMD ["/bin/bash"]
