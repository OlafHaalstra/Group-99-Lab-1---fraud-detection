#!/bin/bash
PORT=8888
NAME="cyber_data_analytics"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CID="$(docker images -q $NAME)"


echo "Container found, id: $CID"
if [[ $CID == "" ]]; then
	docker build -t $NAME .
fi

echo "Starting container..."
docker run -p $PORT:8888 -v $DIR/workspace:/home/jovyan/workspace $NAME
