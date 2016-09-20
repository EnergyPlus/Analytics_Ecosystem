# Ansible command to deploy nts server

. ./init.sh

ansible-playbook \
  -i ${inventory} ${PLAYBOOKS_DIR}/gitlab/gitlab_runners.yml "$@"
