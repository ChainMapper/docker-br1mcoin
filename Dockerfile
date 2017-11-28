FROM ubuntu:xenial

ENV GIT_COIN_URL    https://github.com/br1m/Source
ENV GIT_COIN_NAME   br1m    

RUN ln -s /data /bitcoin

RUN apt-get update \
    && apt-get -y upgrade \
	&& apt-get -y install libboost-system1.58.0 libboost-filesystem1.58.0 libboost-program-options1.58.0 \
	libboost-thread1.58.0 libdb4.8 libdb4.8++ libssl1.0.0 \
    && apt-get -y install git build-essential libtool autotools-dev automake \
    pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev \
    libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev \
    libboost-test-dev libboost-thread-dev software-properties-common libgmp3-dev \
    && add-apt-repository ppa:bitcoin/bitcoin \
    && apt-get update \
    && apt-get -y install libdb4.8-dev libdb4.8++-dev \
	&& git clone $GIT_COIN_URL $GIT_COIN_NAME \
	&& cd $GIT_COIN_NAME/src \
	&& cd leveldb && chmod +x ./build_detect_platform && make clean && make all libmemenv.a && cd .. \
	&& mkdir obj && make -f makefile.unix "USE_UPNP=-" \
	&& cp br1md /usr/local/bin \
	&& cd / && rm -rf /$GIT_COIN_NAME \
	&& mkdir -p /data/.$GIT_COIN_NAME \
	&& mkdir /config \
	&& apt-get -y remove git build-essential libtool autotools-dev automake \
    pkg-config libssl-dev libevent-dev bsdmainutils libboost-system-dev \
    libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev \
    libboost-test-dev libboost-thread-dev software-properties-common libgmp3-dev \
	libdb4.8-dev libdb4.8++-dev \ 
	&& apt-get -y install libdb4.8 libdb4.8++ \
    && apt-get -y autoremove
	
#Add a config so you can run without providing a br1m.conf through a volume
COPY br1m.conf /data/.br1m/br1m.conf

EXPOSE 17178

ENV HOME /data

COPY start.sh /start.sh
RUN chmod 777 /start.sh
CMD /start.sh