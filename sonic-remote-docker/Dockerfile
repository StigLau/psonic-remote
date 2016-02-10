From cantara/zulu9-minimal
MAINTAINER stig@lau.no

ENV sonicbin=install_sonic_2015_sp2_container_launcher.bin
WORKDIR /home/sonic
ENV instfolder=${sonicfolder}/sonicinstall
ENV remotefile=https://www.dropbox.com/s/r25b3nnak4jcyo7/install_container_launcher.bin?dl=1

#Fetch installer.bin from repository
#ADD ${remotefile} ${sonicbin}
RUN wget ${remotefile} -O ${sonicbin}

RUN chmod +x ${sonicbin}

COPY installer.properties installer.properties

#Workaround because of java.net.UnknownHostException
RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

EXPOSE 2506

#Start up sonic
CMD ./${sonicbin} -i Silent \
	&& ./install/Containers/Domain1.hostname/launchcontainer.sh "$1" 2>&1 ; bash


