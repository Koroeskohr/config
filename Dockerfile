FROM ubuntu:18.04
COPY ./install_2019.sh /opt/install.sh
COPY ./test.sh /opt/test.sh

ENV USER test

RUN apt-get update && apt-get install -y sudo gnupg2 ca-certificates software-properties-common
RUN useradd test -m
RUN echo 'test ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

WORKDIR /home/test
RUN su test -c 'bash /opt/install.sh'
RUN su test -c 'zsh /opt/test.sh'

CMD sleep infinity
