#!/bin/sh

#ansible-playbook benchmark_tester.yml --tags cleanup_tester
#ansible-playbook benchmark_tester.yml --tags clean_moongen

#ansible-playbook benchmark_switch.yml --tags cleanup_switch
#ansible-playbook benchmark_switch.yml --tags clean_ovs_dpdk
#ansible-playbook benchmark_switch.yml --tags clean_pisces

#ansible-playbook kubernetes.yml --tags destroy_apps
#ansible-playbook kubernetes.yml --tags destroy_cluster
#ansible-playbook kubernetes.yml --tags destroy_overlay
#ansible-playbook kubernetes.yml --tags remove_common

ansible-playbook baseerat.yml --tags cleanup
ansible-playbook baseerat_dc_tor.yml --tags cleanup

#ansible-playbook proxmox.yml --tags cleanup_br0_as_primary_bridge - deprecated!
ansible-playbook proxmox.yml --tags remove_br0_flow_rules
ansible-playbook proxmox.yml --tags destroy_vms
ansible-playbook proxmox.yml --tags cleanup_overlay
#ansible-playbook proxmox.yml --tags clean_pisces
#ansible-playbook proxmox.yml --tags remove_template
#ansible-playbook proxmox.yml --tags cleanup_hosts

ansible-playbook proxmox_tor.yml --tags cleanup_tor_network
#ansible-playbook proxmox_tor.yml --tags clean_ovs_dpdk
ansible-playbook proxmox_tor.yml --tags clean_pisces

ansible-playbook proxmox_dc.yml --tags cleanup_dc_network
#ansible-playbook proxmox_dc.yml --tags clean_ovs_dpdk
ansible-playbook proxmox_dc.yml --tags clean_pisces
