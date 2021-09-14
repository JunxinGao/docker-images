ARG BASE_IMAGE="nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04"
ARG CONDA_HOME="/opt"
FROM ${BASE_IMAGE}

LABEL maintainer="Junxin Gao <junxin.gao@outlook.com>"

# Set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

# Install base dependencies
RUN apt-get update && \
    apt-get install -y curl git wget unzip vim screen htop libsm6 libxext6 libxrender-dev openssh-server locales sudo procps lsb-release dumb-init && \
    rm -rf /var/lib/apt/lists/*

# locale
RUN sed -i "s/# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8

# fixuid
RUN ARCH="$(dpkg --print-architecture)" && \
    curl -fsSL "https://github.com/boxboat/fixuid/releases/download/v0.5/fixuid-0.5-linux-$ARCH.tar.gz" | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid

ARG CODER_VER="3.11.1"
ENV CODER_DEB="https://github.com/cdr/code-server/releases/download/v${CODER_VER}/code-server_${CODER_VER}_amd64.deb"
RUN wget ${CODER_DEB} -O /tmp/code-server.deb && \
    dpkg -i /tmp/code-server.deb && rm /tmp/code-server.deb

# Install Anaconda
ARG CONDA_HOME
ENV CONDA_HOME="${CONDA_HOME}"
RUN mkdir -p $CONDA_HOME && chown 1000:1000 -R $CONDA_HOME
USER 1000
ARG ANACONDA="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
RUN curl ${ANACONDA} -o /tmp/anaconda.sh && \
    /bin/bash /tmp/anaconda.sh -b -p ${CONDA_HOME}/conda && \
    rm /tmp/anaconda.sh
RUN . ${CONDA_HOME}/conda/etc/profile.d/conda.sh && conda install jupyter

USER root
ENV PATH="${CONDA_HOME}/conda/bin:${PATH}"
COPY entrypoint.sh /usr/bin/entrypoint.sh
WORKDIR /data
EXPOSE 8080
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
