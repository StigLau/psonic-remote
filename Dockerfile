From cantara/zulu9-minimal
MAINTAINER stig@lau.no

WORKDIR /home/sonic

ENV sonicbin=sonic-central-install.bin

ADD install.bin ${sonicbin}

RUN chmod +x ${sonicbin}

COPY installer.properties installer.properties

#Workaround because of java.net.UnknownHostException
RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

#Start up sonic
ENTRYPOINT ./${sonicbin} -i Silent \
	&& ./install/Containers/Domain1.DomainManager/launchcontainer.sh "$1" 2>&1 ; bash