#!/bin/sh

ansible-playbook proxmox.yml --tags create_vms
ansible-playbook common.yml --tags install
ansible-playbook kubernetes.yml --tags create_overlay
ansible-playbook kubernetes.yml --tags create_cluster
