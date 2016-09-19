# Ansible command to deploy nts server

# Define variables
INVENTORY_FILE='Inventory/vagrant_servers'
ANSIBLE_HOSTS='support-server'

PLAY_BOOK='Playbooks/extra_server.yml'
TAGS='nfs'

# ping test
connect=$(ansible ${ANSIBLE_HOSTS} -m ping | awk '{print $3}')

if [[ "${connect}" = 'SUCCESS' ]]; then
  ansible command
  ansible-playbook --inventory=$INVENTORY_FILE \
  --tags=$TAGS                \
  $PLAY_BOOK
fi
