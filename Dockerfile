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

#RUN echo $(grep $(hostname) /etc/hosts | cut -f1) my.host.name >> /etc/hosts && install-software


RUN ${instfolder}/${sonicbin}.sh -i Silent; exit 0



#Commands:
# docker build -t sonic .
# docker run -it sonic /bin/bash #/bin/bash is for for debugging 
