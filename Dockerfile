FROM debian:latest

RUN apt-get update -y && apt upgrade -y
RUN apt-get install nginx tor openssh-server vim -y

COPY config/sshd_config /etc/ssh/sshd_config

COPY config/torrc /etc/tor/torrc

COPY config/index.html /usr/share/nginx/html/index.html

COPY config/nginx.conf /etc/nginx/nginx.conf

RUN useradd -m pepe
RUN echo "pepe:onion" | chpasswd

ENTRYPOINT service ssh start; nginx; tor
