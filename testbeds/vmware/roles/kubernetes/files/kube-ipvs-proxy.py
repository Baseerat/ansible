#!/usr/bin/env python

import sys
from fabric.api import local
from fabric.state import output

output['everything'] = False
capture = True
namespace = sys.argv[1]
api_host = sys.argv[2]
command = sys.argv[3]
service_name = sys.argv[4]
scheduler = sys.argv[5]

service_names = local("kubectl --namespace=%s get services -s %s -o jsonpath={.items[*].metadata.name}" % (namespace, api_host,), capture=capture)

if service_name in service_names:
    service_ip = local("kubectl --namespace=%s get service %s -s %s -o jsonpath={.spec.clusterIP}" % (namespace, service_name, api_host,), capture=capture)
    service_port = local("kubectl --namespace=%s get service %s -s %s -o jsonpath={.spec.ports[].port}" % (namespace, service_name, api_host,), capture=capture)
    endpoint_ips = local("kubectl --namespace=%s get endpoints %s -s %s -o jsonpath={.subsets[].addresses[*].ip}" % (namespace, service_name, api_host,), capture=capture).split(" ")
    endpoint_port = local("kubectl --namespace=%s get endpoints %s -s %s -o jsonpath={.subsets[].ports[].port}" % (namespace, service_name, api_host,), capture=capture)

    if command == "sync":
        local("ip addr add %s/32 dev ipvs0" % (service_ip,))

        local("ipvsadm -A -t %s -s %s" % (service_ip + ":" + service_port, scheduler))
        for endpoint_ip in endpoint_ips:
            local("ipvsadm -a -t %s -r %s -m" % (service_ip + ":" + service_port, endpoint_ip + ":" + endpoint_port))
    elif command == "clear":
        local("ipvsadm -D -t %s" % (service_ip + ":" + service_port,))
        local("ip addr del %s/32 dev ipvs0" % (service_ip,))
