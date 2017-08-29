#!/usr/bin/env bash

RANDOM=$1

while : ; do
  # flip a coin
  FLIP=$((${RANDOM}%2))

  if [ $FLIP -eq 1 ]
  then
    inf-loop-cpulimit.sh $2 $3 $4 &
    sleep $5
    pkill -u root -f inf-loop.sh
  else
    sleep $5
  fi
done