FROM docker:dind

RUN apk update \    
	&& apk add --no-cache openssh tzdata docker-compose git wget unzip vim screen htop sudo\
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& sed -i "s/#PermitRootLogin.*/PermitRootLogin no/g" /etc/ssh/sshd_config \
	&& ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key \
	&& ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key \ 
	&& ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key \
	&& ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key \
	&& echo "root:dind" | chpasswd

COPY dockerd-entrypoint.sh /usr/local/bin/
