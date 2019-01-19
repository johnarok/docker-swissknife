FROM debian:buster-slim
RUN apt-get update && \
    apt-get install -y \
                   vim \
		   wget \
		   dnsutils \
                   net-tools
RUN apt-get install -y \
    		   libc-ares-dev \
                   build-essential && \
   export VERSION=$(wget https://curl.haxx.se/docs/releases.csv && cat releases.csv | awk -F';' '{print $2}' | head -n 1) && \
   wget https://curl.haxx.se/download/curl-${VERSION}.tar.gz && \
   tar -xvf curl-${VERSION}.tar.gz && \
   rm -rf curl-${VERSION}.tar.gz && \
   cd curl-${VERSION} && \
   ./configure --enable-ares && \
   make && \
   make install && \
   ldconfig && \
   cd .. && \
   rm -rf curl-${VERSION} && \
   apt remove -y --purge build-essential && \
   apt-get clean && \
   apt autoremove -y

