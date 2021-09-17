FROM ubuntu:20.10

RUN apt update -y && \
    apt upgrade -y && \
    apt install wget -y

RUN apt update -y && \
    apt upgrade -y &&\
    wget -O /usr/share/keyrings/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg && \
    apt install mkvtoolnix mkvtoolnix-gui -y

VOLUME [ "/inputFolder" ]

VOLUME [ "/outputFolder" ]

RUN mkdir -p /scripts

COPY ./convertscript.sh /scripts

WORKDIR /scripts

RUN chmod 777 ./convertscript.sh

WORKDIR /

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]