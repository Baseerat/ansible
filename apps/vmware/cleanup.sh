#!/bin/sh

#ansible-playbook sflow.yml --tags destroy_sflow
#ansible-playbook sflow.yml --tags remove_common

#ansible-playbook workload.yml --tags cleanup_lb_workload
#ansible-playbook feedback.yml --tags cleanup_memcached

rm -f ansible.cfg
rm -f inventory.ini
rm -f ssh_config
rm -rf ./keys
rm -rf ./vars/kubernetes

#../../testbeds/vmware/cleanup.sh