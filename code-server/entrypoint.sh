#!/bin/sh
set -eu
USER_NAME=${USER_NAME:-coder}
USER_PW=${USER_PW:-${USER_NAME}}
SUDO_GROUP=${SUDO_GROUP:-sudo}

if id -u ${USER_NAME} > /dev/null 2>&1; then
  echo "user: ${USER_NAME} exists"
else
  useradd ${USER_NAME} -s /bin/bash -u 1000 -d /home/$USER_NAME -m && echo "${USER_NAME}:${USER_PW}" | chpasswd && usermod ${USER_NAME} -aG ${SUDO_GROUP}
  echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd
  echo "user: ${USER_NAME} added"
fi

printf "user: $USER_NAME\ngroup: $USER_NAME\n" > /etc/fixuid/config.yml
service ssh start


su $USER_NAME <<- EOF

if cat ~/.bashrc | grep ". ${CONDA_HOME}/conda/etc/profile.d/conda.sh" > /dev/null
then
  echo "conda env already set up"
else
  echo ". ${CONDA_HOME}/conda/etc/profile.d/conda.sh" >> ~/.bashrc
  echo "conda activate base" >> ~/.bashrc
fi

dumb-init /usr/bin/code-server --bind-addr 0.0.0.0:8080 .

EOF
