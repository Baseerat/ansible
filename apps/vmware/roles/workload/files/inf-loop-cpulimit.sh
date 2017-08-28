#!/usr/bin/env bash

for i in `seq 1 $1`; do cpulimit -l $2 inf-loop.sh & done