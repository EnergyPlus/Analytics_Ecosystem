#!/bin/bash

FILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${FILE_DIR}/../init.sh

# use localhost inventory
# run etcd playbook
# run docker playbook
# run kubernetes-master playbook
# run add-ons playbook
# run kubernetes-node playbook

# kubernetes roles takes care of token and certs generating

# skipping configure tasks as we don't want to override default configuration
# of etcd and docker.
ansible-playbook -i ${inventory} \
                    ${PLAYBOOKS_DIR}/k8s/deploy-preansible.yml "$@"

ansible-playbook -i ${inventory}                         \
                    ${PLAYBOOKS_DIR}/k8s/deploy-etcd.yml \
                    --skip-tags="configure" "$@"

ansible-playbook -i ${inventory}                           \
                    ${PLAYBOOKS_DIR}/k8s/deploy-docker.yml \
                    --skip-tags="configure" "$@"

ansible-playbook -i ${inventory} \
                    ${PLAYBOOKS_DIR}/k8s/deploy-master.yml "$@"

ansible-playbook -i ${inventory} \
                    ${PLAYBOOKS_DIR}/k8s/deploy-addons.yml "$@"

ansible-playbook -i ${inventory} \
                    ${PLAYBOOKS_DIR}/k8s/deploy-node.yml "$@"
