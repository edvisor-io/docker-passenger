FROM edvisor/nginx-node:1.8

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7 \
 && sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger jessie main > /etc/apt/sources.list.d/passenger.list' \
 && apt-get update \
 && apt-get install -y --force-yes --no-install-recommends\
   -o Dpkg::Options::="--force-overwrite" -o Dpkg::Options::="--force-confold"\
      nginx-extras \
      passenger \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

