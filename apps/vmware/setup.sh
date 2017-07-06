#!/bin/sh

#../../testbeds/vmware/setup.sh

cp -f ../../testbeds/vmware/ansible.cfg .
cp -f ../../testbeds/vmware/inventory.ini .
cp -f ../../testbeds/vmware/ssh_config .
cp -rf ../../testbeds/vmware/keys ./keys
cp -f ../../testbeds/vmware/vars/kubernetes.yml ./vars
cp -f ../../testbeds/vmware/roles/kubernetes/defaults/main.yml ./vars/kubernetes.defaults.yml
