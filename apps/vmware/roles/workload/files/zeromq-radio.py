#!/usr/bin/env python

import psutil
import sys
import time
import zmq

# If the calculation of the load AND the weighting
# of the load data is at the same interval (1 minute) then we
# will see a lot of jerkiness. So we take the 5 minute average.
# This means servers get lowered in priority more slowly.

broker_address = sys.argv[1]
timeout = float(sys.argv[2])
group = sys.argv[3]
alpha_value = float(sys.argv[4])
inv_alpha_value = 1 - alpha_value

cpus = {
    # __insert_here__
}

state = {}
for server_address in cpus:
    state[server_address] = 0

ctx = zmq.Context.instance()
radio = ctx.socket(zmq.RADIO)

radio.connect('udp://%s' % broker_address)


def get_stats():
    cpu_times = psutil.cpu_times(percpu=True)
    _idle = []
    _total = []
    for cpu_time in cpu_times:
        _idle += [cpu_time.idle]
        _total += [cpu_time.idle + (cpu_time.user + cpu_time.system + cpu_time.nice + cpu_time.irq + cpu_time.softirq)]
    return _idle, _total


last_idle, last_total = get_stats()

cpu_percents = psutil.cpu_percent(percpu=True, interval=0.1)
util = []
weight = []
for cpu_percent in cpu_percents:
    _util = 100 - cpu_percent
    util += [_util]
    weight += [_util]

while True:
    idle, total = get_stats()

    for server_address in cpus:
        cpu_id = cpus[server_address]
        if (total[cpu_id] - last_total[cpu_id]) != 0:
            util[cpu_id] = 100.0 * (idle[cpu_id] - last_idle[cpu_id]) / (total[cpu_id] - last_total[cpu_id])
        weight[cpu_id] = int((alpha_value * util[cpu_id]) + (inv_alpha_value * weight[cpu_id]))
        if weight[cpu_id] == 0:
            weight[cpu_id] = 1
        # else: weight = XXX
        last_idle[cpu_id], last_total[cpu_id] = idle[cpu_id], total[cpu_id]
        state[server_address] = weight[cpu_id]

    radio.send_pyobj(state, group=group)

    time.sleep(timeout)

radio.close()
ctx.term()
