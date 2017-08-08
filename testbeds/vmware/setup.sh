#!/bin/sh

ansible-playbook proxmox_dc.yml --tags install_pisces
#ansible-playbook proxmox_dc.yml --tags install_ovs_dpdk
ansible-playbook proxmox_dc.yml --tags setup_dc_network

ansible-playbook proxmox_tor.yml --tags install_pisces
#ansible-playbook proxmox_tor.yml --tags install_ovs_dpdk
ansible-playbook proxmox_tor.yml --tags setup_tor_network

#TODO: add arp rules for dc and tor.

#ansible-playbook proxmox.yml --tags add_template
ansible-playbook proxmox.yml --tags setup_overlay
ansible-playbook proxmox.yml --tags create_vms
ansible-playbook proxmox.yml --tags add_br0_flow_rules
#ansible-playbook proxmox.yml --tags setup_br0_as_primary_bridge
sleep 30

ansible-playbook baseerat.yml --tags setup

#ansible-playbook kubernetes.yml --tags install_common
#ansible-playbook kubernetes.yml --tags create_overlay
#ansible-playbook kubernetes.yml --tags create_cluster
#ansible-playbook kubernetes.yml --tags create_apps
