#!bin/bash
docker stop dockerize 2>/dev/null
docker rm dockerize 2>/dev/null

docker rmi ascii-art-web-docker 2>/dev/null

if [ -f ascii-art-web-docker.tar ]; then
rm ascii-art-web-docker.tar
fi
