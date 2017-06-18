#!/bin/bash

ssh -F $1 -i $2 -A -t pve1 -A -t ssh $3