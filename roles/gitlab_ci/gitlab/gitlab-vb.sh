
current_path=$(pwd)

remote_host_user=vagrant
remote_host_idf=~/.vagrant.d/insecure_private_key
remote_host_name=GitlabRunner-VM
remote_host_IP=172.32.120.10

echo ${remote_host_user}
echo ${remote_host_idf}
echo ${remote_host_name}
echo ${remote_host_IP}

echo ${current_path}

ssh ${remote_host_IP} "sudo mkdir -p '${current_path}'"

ssh ${remote_host_IP} "sudo chown -R '${remote_host_user}':'${remote_host_user}' /Users"

rsync -ravzP --delete ${current_path}/* \
    ${remote_host_user}@${remote_host_IP}:${current_path}

rsync -ravzP --delete ${current_path}/.git \
    ${remote_host_user}@${remote_host_IP}:${current_path}/

rsync -ravzP --delete ${current_path}/.gitignore \
    ${remote_host_user}@${remote_host_IP}:${current_path}/

rsync -ravzP --delete ${current_path}/.gitlab-ci.yml \
    ${remote_host_user}@${remote_host_IP}:${current_path}/

gitlab-ci-multi-runner --debug exec virtualbox \
    --ssh-user='vagrant' \
    --ssh-host='172.32.120.10' \
    --ssh-password='vagrant' \
    --virtualbox-base-name='GitlabRunner-VM' \
    --virtualbox-base-snapshot='git_ready' \
    job1

ssh ${remote_host_IP} "sudo ls -l '${current_path}'"

ssh ${remote_host_IP} "sudo rm -rf /Users"
