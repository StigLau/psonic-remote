From cantara/zulu9-minimal
MAINTAINER stig@lau.no

ENV sonicbin=install_sonic_2015_sp2_container_launcher

ENV instfolder=/jalla/sonicinstall

#RUN \
#	mkdir -p ${instfolder} && \
#	curl https://s3.amazonaws.com/kompost/psonix/${sonicbin}.bin --output /${instfolder}/${sonicbin}.sh && \
#	chmod +x ${instfolder}/${sonicBin}.sh

COPY ${sonicbin}.bin /${instfolder}/${sonicbin}.sh

RUN chmod +x ${instfolder}/${sonicbin}.sh

COPY installer.properties ${instfolder}/installer.properties

#Start up sonic
CMD ${instfolder}/${sonicbin}.sh -i Silent \
	&& /home/sonic/Containers/Domain1.hostname/launchcontainer.sh "$1" 2>&1


#Commands:
# docker build -t sonic .
# docker run -it sonic /bin/bash #/bin/bash is for for debugging 
# docker exec -it [container-id] bash # debug after startup

# docker run -i -t stiglau/psonic-remote # Running normally