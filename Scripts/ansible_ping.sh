#!/bin/sh

ansible_hosts='all'

if [[ $# -eq 0 ]]
then
    echo 'ping all ansible hosts'
else
    echo 'pint '$@' ansble hosts'
    ansible_hosts="$@"
fi
ansible ${ansible_hosts} -m ping
