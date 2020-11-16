FROM alpine:3.10

EXPOSE 8888
WORKDIR /opt

LABEL maintainer="Dspaes <archiso@tuta.io>"
ARG NB_USER="dspaes"
ARG NB_UID="1000"
ARG NB_GID="100"

ENV SHELL=/bin/sh

RUN apk add --no-cache libffi-dev py3-zmq linux-headers musl-dev gcc python3-dev python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools notebook 

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
