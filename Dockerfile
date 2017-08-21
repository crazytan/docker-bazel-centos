FROM centos:latest

# install dependencies
RUN yum -y update && yum -y install java-1.8.0-openjdk-devel \
    findutils \
    zip \
    unzip \
    git \
    zlib-devel \
    make \
    cmake \
    time \
    which \
    centos-release-scl

RUN yum -y install devtoolset-4-gcc \
    devtoolset-4-gcc-c++ \
    devtoolset-4-binutils

# download and compile
ADD https://github.com/bazelbuild/bazel/releases/download/0.5.3/bazel-0.5.3-dist.zip /usr/src/
WORKDIR /usr/src
RUN unzip bazel-0.5.3-dist.zip -d bazel-0.5.3 > /dev/null \
 && rm -f bazel-0.5.3-dist.zip \
 && source /opt/rh/devtoolset-4/enable \
 && bash bazel-0.5.3/compile.sh \
 && ln -s /usr/src/bazel-0.5.3/output/bazel /usr/bin/bazel

# set up workspace
RUN mkdir -p /usr/src/app
ENV WORKSPACE /usr/src/app
WORKDIR /usr/src/app
