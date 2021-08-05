# Quick start

Non-root user configs(with sudo)

| Environ Key | Default value | Remark               |
| ----------- | ------------- | -------------------- |
| USER_NAME   | user          |                      |
| USER_UID    | 1001          |                      |
| USER_GID    | 1001          |                      |
| USER_PW     | user          | same as ${USER_NAME} |
| WORK_HOME   | /work         | ${USER_NAME}'s home  |

*root user password: dind (PermitRootLogin: no)*

Use docker-compose

~~~
version: "3.3"
services:
  dameon:
    image: junxin/ubuntu-dind:latest
    restart: unless-stopped
    volumes:
      - /tmp/dockerindocker/certs-ca:/certs/ca
      - /tmp/dockerindocker/certs-client:/certs/client
      - /tmp/dockerindocker/var-lib-docker:/var/lib/docker
    ports:
      - "2233:22"
    environment:
      DOCKER_TLS_CERTDIR: /certs
      USER_PW: dind # change password from 'user' to 'dind'
    privileged: true
~~~
