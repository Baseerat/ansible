#!/usr/bin/env bash

for j in `seq 1 $3`; do
    for i in `seq 1 $1`; do taskset -c $(($j-1)) cpulimit -l $2 inf-loop.sh & done
done