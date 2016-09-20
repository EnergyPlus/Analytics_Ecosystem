#!/bin/bash

FILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${FILE_DIR}/../init.sh

ansible-playbook \
  -i ${inventory} ${PLAYBOOKS_DIR}/k8s/deploy-master.yml \
  --tags "restart" \
  --extra-vars "apiserver_modified=true controller_manager_modified=true scheduler_modified=true kubelet_modified=true" \
  "$@"
