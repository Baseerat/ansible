#!/usr/bin/env bash

for j in `seq 1 $3`; do
    for i in `seq 1 $1`; do taskset -c $(($(($j-1))*$4)) cpulimit -l $2 inf-loop.sh & done
#    for i in `seq 1 $1`; do nice --9 taskset -c $(($(($j-1))*$4)) inf-loop.sh & done
done