From cantara/zulu9-minimal
MAINTAINER stig@lau.no

ENV sonicbin=install_sonic_2015_sp2_container_launcher.bin
env instfolder=/root/sonicinstall

#RUN \
#	mkdir -p ${instfolder} && \
#	curl https://s3.amazonaws.com/kompost/psonix/${sonicbin} --output /${instfolder}/${sonicbin} && \
#	chmod +x ${instfolder}/${sonicBin}


RUN curl https://s3.amazonaws.com/kompost/psonix/${sonicbin} --output /tmp/${sonicbin}

RUN \
	mkdir -p ${instfolder} && \
	cp /tmp/${sonicBin} ${instfolder}/${sonicBin}
	chmod +x ${instfolder}/${sonicBin}



#COPY config file + license from outside the container 
COPY installer.properties ${instfolder}/installer.properties

#Install and set up sonic
#RUN ${instfolder}/${sonicBin} -i Silent


#Commands:
# docker build -t sonic .
# docker run -it sonic /bin/bash #/bin/bash is for for debugging 
