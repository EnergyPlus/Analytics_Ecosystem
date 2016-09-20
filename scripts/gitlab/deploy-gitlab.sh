# Ansible command to deploy nts server

. ./init.sh

# Define variables
inventory=${INVENTORY:-${INVENTORY_DIR}/vagrant_inventory}

ansible-playbook \
  -i ${inventory} ${PLAYBOOKS_DIR}/gitlab/gitlab_server.yml "$@"
