Commands
========
docker build -t stiglau/psonic-remote .
docker run  -it stiglau/psonic-remote /bin/bash #/bin/bash is for for debugging 
docker run  -it stiglau/psonic-remote # Running normally
docker exec -it [container-id] bash # debug after startup


Push stuff
----------
docker push stiglau/psonic-remote
