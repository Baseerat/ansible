#!/bin/sh

#../../testbeds/vmware/setup.sh

cp -f ../../testbeds/vmware/ansible.cfg .
cp -f ../../testbeds/vmware/inventory.ini .
cp -f ../../testbeds/vmware/ssh_config .
cp -rf ../../testbeds/vmware/keys ./keys
cp -rf ../../testbeds/vmware/vars/kubernetes ./vars
cp -f ../../testbeds/vmware/roles/kubernetes/defaults/main.yml ./vars/kubernetes/defaults.yml

#ansible-playbook feedback.yml --tags setup_memcached
#ansible-playbook workload.yml --tags setup_lb_workload
#ansible-playbook workload.yml --tags run_lb_workload
#ansible-playbook workload.yml --tags collect_lb_workload
