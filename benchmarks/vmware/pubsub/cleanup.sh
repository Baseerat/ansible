#!/bin/sh

#ansible-playbook mqtt_vms.yml --tags remove_common
#ansible-playbook mqtt_vms.yml --tags cleanup_mqtt
#ansible-playbook zeromq_vms.yml --tags remove_common
#ansible-playbook zeromq_vms.yml --tags destroy_fanout

rm -f ansible.cfg
rm -f inventory.ini
rm -f ssh_config
rm -rf ./keys
rm -rf ./vars/proxmox