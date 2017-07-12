#!/bin/sh

#ansible-playbook kubernetes.yml --tags destroy_cluster
#ansible-playbook kubernetes.yml --tags destroy_overlay
#ansible-playbook kubernetes.yml --tags remove_common
ansible-playbook proxmox.yml --tags cleanup_br0_as_primary_bridge
ansible-playbook proxmox.yml --tags destroy_vms
ansible-playbook proxmox.yml --tags destroy_overlay
#ansible-playbook proxmox.yml --tags remove_template
