FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
		libtool \
		autoconf \
		build-essential \
		python \
		python-dev \
		python-pip \
		python-matplotlib \
		git

WORKDIR /root
RUN git clone https://github.com/Baseerat/httperf.git \
&&  git clone https://github.com/Baseerat/httperf-plot.git

WORKDIR /root/httperf
RUN autoreconf -i \
&&  ./configure \
&&  make \
&&  make install

WORKDIR /root
RUN echo 'root        hard    nofile      65535' | tee -a /etc/security/limits.conf \
&&  echo 'root        soft    nofile      65535' | tee -a /etc/security/limits.conf \
&&  echo 'fs.file-max = 131071'                  | tee -a /etc/sysctl.conf \
&&  sysctl -p
