#!/bin/bash
export COLCON_DEFAULT_EXECUTOR=sequential 
export MAKEFLAGS="-j1 -l1" 

# cpulimit --limit 10 --monitor-forks --foreground -- \

systemd-run --user --scope -p CPUQuota="5%" \
    colcon build --symlink-install --merge-install

