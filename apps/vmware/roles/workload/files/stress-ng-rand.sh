#!/usr/bin/env bash

RANDOM=$1

while : ; do
  # flip a coin
  FLIP=$((${RANDOM}%2))

  if [ $FLIP -eq 1 ]
  then
    docker run --name $2 -id --rm lorel/docker-stress-ng --cpu $3
    sleep $4
    docker stop $2
  else
    sleep $4
  fi
done