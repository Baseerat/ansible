#!/bin/sh

#ansible-playbook kubernetes.yml --tags destroy_cluster
#ansible-playbook kubernetes.yml --tags destroy_overlay
#ansible-playbook common.yml --tags remove
ansible-playbook proxmox.yml --tags destroy_vms
ansible-playbook proxmox.yml --tags destroy_overlay