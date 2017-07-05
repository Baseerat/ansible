#!/bin/sh

rm -f ansible.cfg
rm -f inventory.ini
rm -f ssh_config
rm -f ./vars/kubernetes.yml
rm -f ./vars/kubernetes.defaults.yml

#../../testbeds/vmware/cleanup.sh