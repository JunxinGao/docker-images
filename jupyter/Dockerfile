ARG HOME="/root"
ARG JUPYTER_TOKEN="''"
ARG BASE_IMAGE="junxin/conda"
ARG CONDA_HOME="/opt"
FROM ${BASE_IMAGE}

LABEL maintainer="Junxin Gao <junxin.gao@outlook.com>"

# Install jupyter
RUN . ${CONDA_HOME}/conda/etc/profile.d/conda.sh && \
    conda install jupyter

# Setup Jupyter notebook configuration
ARG HOME
ENV HOME="${HOME}"
ARG JUPYTER_TOKEN
ENV JUPYTER_TOKEN="${JUPYTER_TOKEN}"
ENV NOTEBOOK_CONFIG="${HOME}/.jupyter/jupyter_notebook_config.py"
RUN mkdir -p ${HOME}/.jupyter && \
    echo "c.NotebookApp.token = ${JUPYTER_TOKEN}" > ${NOTEBOOK_CONFIG} && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> ${NOTEBOOK_CONFIG} && \
    echo "c.NotebookApp.allow_root = True" >> ${NOTEBOOK_CONFIG} && \
    echo "c.NotebookApp.open_browser = False" >> ${NOTEBOOK_CONFIG}

WORKDIR "/work"
