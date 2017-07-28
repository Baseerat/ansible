#!/bin/sh

#ansible-playbook mqtt_vms.yml --tags remove_common
#ansible-playbook mqtt_vms.yml --tags cleanup_mqtt

rm -f ansible.cfg
rm -f inventory.ini
rm -f ssh_config
rm -rf ./keys
rm -rf ./vars/proxmox