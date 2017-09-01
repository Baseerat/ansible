#!/usr/bin/env bash

RANDOM=$1

while : ; do
  # flip a coin
  FLIP=$((${RANDOM}%2))

  if [ $FLIP -eq 1 ]
  then
    taskset -c $2 stress-ng --cpu $3
    sleep $4
    pkill -u root -f stress-ng
  else
    sleep $4
  fi
done