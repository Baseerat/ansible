#!/bin/sh

#ansible-playbook kubernetes.yml --tags destroy_cluster
#ansible-playbook kubernetes.yml --tags destroy_overlay
#ansible-playbook common.yml --tags remove
ansible-playbook proxmox.yml --tags hacks_cleanup_br0_as_primary_bridge
ansible-playbook proxmox.yml --tags destroy_vms
ansible-playbook proxmox.yml --tags destroy_overlay
#ansible-playbook proxmox.yml --tags remove_vm_template