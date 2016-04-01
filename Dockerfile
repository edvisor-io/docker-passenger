FROM debian:jessie

ENV NODE_VERSION 5.9.1

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends\
    apt-transport-https \
    bzip2 \
    ca-certificates \
    curl \
    git \
    rlwrap \
  && curl https://deb.nodesource.com/node_5.x/pool/main/n/nodejs/nodejs_$NODE_VERSION-1nodesource1~jessie1_amd64.deb > node.deb \
  && dpkg -i node.deb \
  && rm node.deb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7 \
 && sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger jessie main > /etc/apt/sources.list.d/passenger.list' \
 && apt-get update \
 && apt-get install -y --force-yes --no-install-recommends\
      nginx-extras \
      passenger \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://raw.githubusercontent.com/edvisor-io/docker-nginx-node/master/nginx.conf /etc/nginx/nginx.conf

