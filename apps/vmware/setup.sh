#!/bin/sh

#../../testbeds/vmware/setup.sh

cp -f ../../testbeds/vmware/ansible.cfg .
cp -f ../../testbeds/vmware/inventory.ini .
cp -f ../../testbeds/vmware/ssh_config .
cp -rf ../../testbeds/vmware/keys ./keys
cp -rf ../../testbeds/vmware/vars/kubernetes ./vars
cp -f ../../testbeds/vmware/roles/kubernetes/defaults/main.yml ./vars/kubernetes/defaults.yml
mkdir -p ./vars/proxmox
cp -f ../../testbeds/vmware/roles/proxmox/defaults/main.yml ./vars/proxmox/defaults.yml

#ansible-playbook feedback.yml --tags setup_memcached
#ansible-playbook workload.yml --tags setup_lb_workload
#ansible-playbook workload.yml --tags run_lb_workload
#ansible-playbook workload.yml --tags collect_lb_workload

#ansible-playbook sflow.yml --tags install_common
#ansible-playbook sflow.yml --tags launch_sflow
#ansible-playbook sflow.yml --tags collect_sflow_stats
