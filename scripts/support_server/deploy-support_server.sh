# Ansible command to deploy nts server

FILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${FILE_DIR}/../init.sh

# Define variables
inventory=${INVENTORY:-${INVENTORY_DIR}/vagrant_inventory}

ansible-playbook \
  -i ${inventory} ${PLAYBOOKS_DIR}/support_server/deploy-support-server.yml "$@"
