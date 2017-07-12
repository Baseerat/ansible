#!/bin/sh

#ansible-playbook proxmox.yml --tags add_vm_template
ansible-playbook proxmox.yml --tags create_overlay
ansible-playbook proxmox.yml --tags create_vms
ansible-playbook proxmox.yml --tags setup_br0_as_primary_bridge
sleep 30
ansible-playbook common.yml --tags install
ansible-playbook kubernetes.yml --tags create_overlay
ansible-playbook kubernetes.yml --tags create_cluster
#ansible-playbook kubernetes.yml --tags create_apps
