# Ansible command to deploy nts server

FILE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. ${FILE_DIR}/../init.sh

ansible-playbook \
  -i ${inventory} ${PLAYBOOKS_DIR}/gitlab/gitlab_server.yml "$@"
