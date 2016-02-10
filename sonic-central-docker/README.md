Commands
========
docker build -t stiglau/sonic-central .
docker run  -it stiglau/sonic-central /bin/bash #/bin/bash is for for debugging 
docker run  -it stiglau/sonic-central # Running normally
docker exec -it [container-id] bash # debug after startup



Push stuff
----------
docker push stiglau/psonic-remote


Volumes
-------
docker run -it -p 8080:8080 -p 2506:2506 -v /tmp/sonic:/home/sonic/install stiglau/sonic-central
