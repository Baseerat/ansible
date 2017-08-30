#!/usr/bin/env python

import sys
import time
import zmq
import commands

broker_port = sys.argv[1]
server_port = sys.argv[2]
service_address = sys.argv[3]
service_port = sys.argv[4]
timeout = float(sys.argv[5])
group = sys.argv[6]
if sys.argv[7] == "True":
    enable = True
else:
    enable = False

ctx = zmq.Context.instance()
dish = ctx.socket(zmq.DISH)
# dish.rcvtimeo = 1000

dish.bind('udp://*:%s' % broker_port)
dish.join(group)

while True:
    state = dish.recv_pyobj()

    for server_address in state:
        weight = state[server_address]
        if not enable:
            weight = 1
        script = "sudo ipvsadm -e -t %s:%s -r %s:%s -m -w %s" % (service_address, service_port, server_address, server_port, weight)
        commands.getstatusoutput(script)
        # print(script)
    time.sleep(timeout)

dish.close()
ctx.term()
