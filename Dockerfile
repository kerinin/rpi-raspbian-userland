FROM resin/rpi-raspbian:jessie

RUN apt-get -y update
RUN apt-get install -y git cmake make build-essential

RUN cd \
      && git clone --depth 1 https://github.com/raspberrypi/userland.git \
      && cd userland \
      && ./buildme
ENV PATH /opt/vc/bin:/opt/vc/lib:$PATH
RUN echo "/opt/vc/lib" > /etc/ld.so.conf.d/00-vmcs.conf
RUN ldconfig
