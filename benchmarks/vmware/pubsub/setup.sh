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
#ansible-playbook zeromq_vms.yml --tags launch_fanout
#ansible-playbook zeromq_vms.yml --tags collect_fanout_stats
#ansible-playbook zeromq_vms.yml --tags launch_fanin
#ansible-playbook zeromq_vms.yml --tags collect_fanin_stats
#ansible-playbook zeromq_vms.yml --tags launch_broker
#ansible-playbook zeromq_vms.yml --tags collect_broker_stats

#ansible-playbook zeromq_hosts.yml --tags install_common
#ansible-playbook zeromq_hosts.yml --tags launch_broker
#ansible-playbook zeromq_hosts.yml --tags collect_broker_stats
