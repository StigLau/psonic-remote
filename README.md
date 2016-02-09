Commands
========
docker build -t stiglau/sonic-central .
docker run  -it stiglau/sonic-central /bin/bash #/bin/bash is for for debugging 
docker run  -it stiglau/sonic-central # Running normally
docker exec -it [container-id] bash # debug after startup


Push stuff
----------
docker push stiglau/psonic-remote