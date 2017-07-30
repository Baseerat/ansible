#!/bin/sh

cp -f ../../../testbeds/vmware/ansible.cfg .
cp -f ../../../testbeds/vmware/inventory.ini .
cp -f ../../../testbeds/vmware/ssh_config .
cp -rf ../../../testbeds/vmware/keys ./keys
mkdir ./vars/proxmox
cp -f ../../../testbeds/vmware/roles/proxmox/defaults/main.yml ./vars/proxmox/defaults.yml

#ansible-playbook mqtt_vms.yml --tags install_common
#ansible-playbook mqtt_vms.yml --tags setup_mqtt
#ansible-playbook zeromq_vms.yml --tags install_common
#ansible-playbook zeromq_vms.yml --tags launch_zeromq
#ansible-playbook zeromq_vms.yml --tags collect_stats
