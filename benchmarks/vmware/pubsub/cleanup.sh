#!/bin/sh

#ansible-playbook mqtt_vms.yml --tags remove_common
#ansible-playbook mqtt_vms.yml --tags cleanup_mqtt

#ansible-playbook zeromq_vms.yml --tags remove_common
#ansible-playbook zeromq_vms.yml --tags destroy_fanout
#ansible-playbook zeromq_vms.yml --tags destroy_fanin
#ansible-playbook zeromq_vms.yml --tags destroy_broker

#ansible-playbook zeromq_hosts.yml --tags remove_common
#ansible-playbook zeromq_hosts.yml --tags destroy_broker

rm -f ansible.cfg
rm -f inventory.ini
rm -f ssh_config
rm -rf ./keys
rm -rf ./vars/proxmox