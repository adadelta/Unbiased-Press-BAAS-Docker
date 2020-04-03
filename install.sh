#!/bin/bash
. ./init-properties.sh

if [[ -z $PORT || -z $PORT_OUT || -z $FULL_PATH_TO_MODEL || -z $NUM_WORKERS || -z $CONTAINER_NAME ]]; then
    echo "You need to supply five arguments (should be in the init-properties.sh file):
      CONTAINER_NAME,
      PORT,
      PORT_OUT,
      NUM_WORKERS,
      FULL_PATH_TO_MODEL"
    exit 0
  else
    docker build -t unbiased-bert-as-service .
    docker run -it -p $PORT:5555 -p $PORT_OUT:5556 --runtime=nvidia -v $FULL_PATH_TO_MODEL:/model --name $CONTAINER_NAME -t unbiased-bert-as-service $NUM_WORKERS
fi