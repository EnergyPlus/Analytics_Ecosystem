#!/bin/sh

FILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${FILE_DIR}/../init.sh

# The developer can specify the hosts to ping with a list of arguments
ansible_hosts='all'

if [[ $# -eq 0 ]]
then
    echo 'ping all ansible hosts'
else
    echo 'pint '$@' ansble hosts'
    ansible_hosts="$@"
fi

ansible -i ${inventory} ${ansible_hosts} -m ping
