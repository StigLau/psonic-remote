From cantara/zulu9-minimal
MAINTAINER stig@lau.no

ENV sonicbin=sonic-central-install.bin
WORKDIR /home/sonic
ENV instfolder=${sonicfolder}/sonicinstall

ADD install.bin ${sonicbin}

RUN chmod +x ${sonicbin}

COPY installer.properties installer.properties

#Workaround because of java.net.UnknownHostException
RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

#create dummy file 
RUN echo “” >> sonicsw.properties


#USER sonic

#Start up sonic
CMD ./${sonicbin} -i Silent \
	&& .Containers/Domain1.DomainManager/launchcontainer.sh "$1" 2>&1 ; bash