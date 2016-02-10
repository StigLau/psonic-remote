From cantara/zulu9-minimal
MAINTAINER stig@lau.no

WORKDIR /home/sonic
VOLUME /home/sonic/install

ENV sonicbin=sonic-central-install.bin
ENV remotefile=https://www.dropbox.com/s/zthid6bkaqhqxuo/install.bin?dl=1

ADD install.bin ${sonicbin}
#ADD ${remotefile} ${sonicbin}
#RUN wget ${remotefile} -O ${sonicbin}

RUN chmod +x ${sonicbin}

COPY installer.properties installer.properties

#Workaround because of java.net.UnknownHostException
RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

EXPOSE 2506

#Start up sonic
ENTRYPOINT ./${sonicbin} -i Silent \
	&& ./install/Containers/Domain1.DomainManager/launchcontainer.sh "$1" 2>&1 ; bash
