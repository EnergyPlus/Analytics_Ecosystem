# Ansible command to deploy nts server

. ./init.sh

# Define variables
inventory=${INVENTORY:-${INVENTORY_DIR}/vagrant_servers}

ansible-playbook \
  -i ${inventory} ${PLAYBOOKS_DIR}/support_server/deploy-support-server.yml "$@"
