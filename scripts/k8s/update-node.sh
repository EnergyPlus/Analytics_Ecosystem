#!/bin/bash

FILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${FILE_DIR}/../init.sh

# no configure tag as it will reset everything to defaults
ansible-playbook \
  -i ${inventory} ${PLAYBOOKS_DIR}/k8s/deploy-node.yml \
  --tags "install,restart" \
  "$@"
