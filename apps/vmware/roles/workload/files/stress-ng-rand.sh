#!/usr/bin/env bash

RANDOM=$1

while : ; do
  # flip a coin
  FLIP=$((${RANDOM}%2))

  if [ $FLIP -eq 1 ]
  then
    docker run --name $2 --cpuset-cpus $3 -id --rm lorel/docker-stress-ng --cpu $4
    sleep $5
    docker stop $2
  else
    sleep $5
  fi
done