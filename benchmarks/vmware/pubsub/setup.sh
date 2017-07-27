#!/bin/sh

cp -f ../../../testbeds/vmware/ansible.cfg .
cp -f ../../../testbeds/vmware/inventory.ini .
cp -f ../../../testbeds/vmware/ssh_config .
cp -rf ../../../testbeds/vmware/keys ./keys
mkdir ./vars/kubernetes
cp -f ../../../testbeds/vmware/roles/kubernetes/defaults/main.yml ./vars/kubernetes/defaults.yml

#ansible-playbook mqtt.yml --tags install_common
#ansible-playbook mqtt.yml --tags setup_mqtt
