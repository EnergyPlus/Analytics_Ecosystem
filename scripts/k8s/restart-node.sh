#!/bin/bash

FILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${FILE_DIR}/../init.sh

ansible-playbook \
  -i ${inventory} ${PLAYBOOKS_DIR}/k8s/deploy-node.yml \
  --tags "restart" \
  --extra-vars "kubelet_modified=true proxy_modified=true" \
  "$@"
