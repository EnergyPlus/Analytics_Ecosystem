#!/bin/bash

CUR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INVENTORY_DIR="${CUR_DIR}/../inventory"
PLAYBOOKS_DIR="${CUR_DIR}/../playbooks"

inventory=${INVENTORY:-${INVENTORY_DIR}/vagrant_inventory}

if [[ ${inventory} = ${INVENTORY_DIR}/vagrant_inventory ]]; then
  export ANSIBLE_HOST_KEY_CHECKING=False
  export ANSIBLE_ROLES_PATH=${HOME}/Projects/NRG/AnsibleRoles/
fi
