#!/usr/bin/env python

import sys
from fabric.api import local
from fabric.state import output

output['everything'] = False
capture = True
api_host = sys.argv[1]
command = sys.argv[2]
service_name = sys.argv[3]
scheduler = sys.argv[4]

service_ip = local("kubectl get service %s -s %s -o jsonpath={.spec.clusterIP}" % (service_name, api_host,), capture=capture)
service_port = local("kubectl get service %s -s %s -o jsonpath={.spec.ports[].port}" % (service_name, api_host,), capture=capture)
endpoint_ips = local("kubectl get endpoints %s -s %s -o jsonpath={.subsets[].addresses[*].ip}" % (service_name, api_host,), capture=capture).split(" ")
endpoint_port = local("kubectl get endpoints %s -s %s -o jsonpath={.subsets[].ports[].port}" % (service_name, api_host,), capture=capture)

if command == "sync":
    local("ip addr add %s/32 dev ipvs0" % (service_ip,))

    local("ipvsadm -A -t %s -s %s" % (service_ip + ":" + service_port, scheduler))
    for endpoint_ip in endpoint_ips:
        local("ipvsadm -a -t %s -r %s -m" % (service_ip + ":" + service_port, endpoint_ip + ":" + endpoint_port))
elif command == "clear":
    local("ipvsadm -D -t %s" % (service_ip + ":" + service_port,))
    local("ip addr del %s/32 dev ipvs0" % (service_ip,))
