# Ubuntu 20.04
# general tools: wget, unzip, git
# CMake 3.19.4
# ccache
# gcc 9.3 (default)
# clang 10.0 (default)

FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
    apt-get install -y\
    wget unzip\
    git \
    build-essential \
    cmake=3.16.3-1ubuntu1 \
    ccache \
    ninja-build \
    libomp-dev \
    clang clang-format clang-tidy clang-tools llvm-dev libclang-dev &&\
    cd /tmp &&\
    version=3.19 && build=4 &&\
    wget https://cmake.org/files/v$version/cmake-$version.$build-Linux-x86_64.tar.gz &&\
    tar -xzvf cmake-$version.$build-Linux-x86_64.tar.gz

ENV PATH="/tmp/cmake-3.19.4-Linux-x86_64/bin:$PATH"