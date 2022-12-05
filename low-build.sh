#!/bin/bash
export COLCON_DEFAULT_EXECUTOR=sequential 
export MAKEFLAGS="-j1 -l1" 

# cpulimit --limit 10 --monitor-forks --foreground -- \

systemd-run --uid=$(id -u) --gid=$(id -g) --scope \
    -p AllowedCPUs=0 -p CPUWeight=10 -p CPUQuota="100%" \
    colcon build --parallel-workers 1 --symlink-install --merge-install

