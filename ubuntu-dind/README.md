# Quick start

Default root password: dind (PermitRootLogin: yes !!!)

Use docker-compose

~~~
version: "3.6"
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
    privileged: true
~~~
