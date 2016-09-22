#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# folders with ansible roles
rolesK8s="${SCRIPT_DIR}/../roles/k8s"
rolesGitlab="${SCRIPT_DIR}/../roles/gitlab_ci"
rolesSServer="${SCRIPT_DIR}/../roles/support_server"
rolesAllHosts="${SCRIPT_DIR}/../roles/all_hosts"

# Ansible env var with roles paths
export ANSIBLE_ROLES_PATH=${rolesK8s}:${rolesGitlab}:${rolesSServer}:${rolesAllHosts}

# Ansible config location
export ANSIBLE_CONFIG=${SCRIPT_DIR}/ansible.cfg

INVENTORY_DIR="${SCRIPT_DIR}/../inventory"

# INVENTORY can be setted with an export from command line
inventory=${INVENTORY:-${INVENTORY_DIR}/vagrant_inventory}

PLAYBOOKS_DIR="${SCRIPT_DIR}/../playbooks"


if [[ ${inventory} = ${INVENTORY_DIR}/vagrant_inventory ]]; then

  # When working with Vagrant locally we don't want to check the ssh key
  export ANSIBLE_HOST_KEY_CHECKING=False

  # Add directories with external ansbile roles
  roles_external="${HOME}/Projects/NRG/AnsibleRoles/"
  export ANSIBLE_ROLES_PATH=${ANSIBLE_ROLES_PATH}:${roles_external}
fi
