#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export ANSIBLE_ROLES_PATH="${SCRIPT_DIR}/../roles"
export ANSIBLE_CONFIG=${SCRIPT_DIR}/ansible.cfg

INVENTORY_DIR="${SCRIPT_DIR}/../inventory"
PLAYBOOKS_DIR="${SCRIPT_DIR}/../playbooks"

inventory=${INVENTORY:-${INVENTORY_DIR}/vagrant_inventory}

if [[ ${inventory} = ${INVENTORY_DIR}/vagrant_inventory ]]; then
  export ANSIBLE_HOST_KEY_CHECKING=False

  external_roles="${HOME}/Projects/NRG/AnsibleRoles/"
  export ANSIBLE_ROLES_PATH=${ANSIBLE_ROLES_PATH}:${external_roles}
fi
