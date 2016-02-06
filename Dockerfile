From cantara/zulu9-minimal
MAINTAINER stig@lau.no

ENV sonicbin=install_sonic_2015_sp2_container_launcher

ENV sonicfolder=/home/sonic
ENV instfolder=${sonicfolder}/sonicinstall

#Fetch installer.bin from repository
RUN \ 
	mkdir -p ${instfolder} && \
	curl https://s3.amazonaws.com/kompost/psonix/${sonicbin}.bin --output /${instfolder}/${sonicbin}.sh && \
	chmod +x ${instfolder}/${sonicBin}.sh


#COPY ${sonicbin}.bin /${instfolder}/${sonicbin}.sh #Alternative - fetch installer.bin from local directory

RUN chmod +x ${instfolder}/${sonicbin}.sh

COPY installer.properties ${instfolder}/installer.properties

#Start up sonic
CMD ${instfolder}/${sonicbin}.sh -i Silent \
	&& ${sonicfolder}/Containers/Domain1.hostname/launchcontainer.sh "$1" 2>&1


