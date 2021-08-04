ARG WORKSPACE="/work"
ARG BASE_IMAGE="ubuntu:18.04"
ARG CONDA_HOME="/opt"
FROM ${BASE_IMAGE}

LABEL maintainer="Junxin Gao <junxin.gao@outlook.com>"

# Set timezome
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

# Install base dependencies
RUN apt-get update && \
    apt-get install -y curl git wget unzip vim screen htop libsm6 libxext6 libxrender-dev openssh-server locales

# Install Anaconda
ARG CONDA_HOME
ENV CONDA_HOME="${CONDA_HOME}"
ARG ANACONDA="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
RUN curl ${ANACONDA} -o anaconda.sh && \
    /bin/bash anaconda.sh -b -p ${CONDA_HOME}/conda && \
    rm anaconda.sh && \
    echo ". ${CONDA_HOME}/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc
ENV PATH="${CONDA_HOME}/conda/bin:${PATH}"

WORKDIR ${WORKSPACE}
