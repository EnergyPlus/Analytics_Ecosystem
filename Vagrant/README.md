# Welcome to the Vagrant Deployer for Analytics Team, using Ansible

This deployer spins-up the requested VM's to deploy a full development environment using Gitlab/Gitlab-CI & Kubernetes cluster on Vagrant. The Cluster is provisioned using Ansible.

This `Vagrantfile` is __NOT__ configured to provision the VM's.

## Before You Start

Make sure you have [git installed](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and clone the contrib repo:


    git clone https://github.com/EnergyPlus/Analytics_Ecosystem.git


[Install Vagrant](https://www.vagrantup.com/downloads.html) if it's not currently installed on your system.

You will need a functioning [vagrant provider](https://www.vagrantup.com/docs/providers/). Currently supported providers are openstack, libvirt, and virtualbox. Vagrant comes with VirtualBox support by default. No matter what provider you choose, you need to install the OpenStack Vagrant plugin:

    vagrant plugin install vagrant-openstack-provider --plugin-version ">= 0.6.1"

### Fedora

When running the ``vagrant`` on Fedora (tested on F24) don't forget to install necessary dependencies:

    dnf install -y ruby-devel gcc redhat-rpm-config

When provisioning VMs with libvirt provider, don't forget to install ``vagrant-libvirt``:

    dnf install -y vagrant-libvirt

## Usage

You can change some aspects of configuration using environment variables.
Note that these variables should be set for all vagrant commands invocations,
`vagrant up`, `vagrant provision`, `vagrant destroy`, etc.

### Configure number of nodes

If you export an env variable such as

    export NUM_NODES=4

The system will create that number of nodes. Default is 2.

### Configure OS to use

You can specify which OS image to use on hosts:

    export OS_IMAGE=centos7

By default CentOS 7 image is used.

Supported images:

* `centos7` (default) - CentOS 7 supported on OpenStack, VirtualBox, Libvirt providers.
<!-- * `coreos` - [CoreOS](https://coreos.com/) supported on VirtualBox provider. -->
* `fedora` - supported at least on Libvirt provider


### Start your cluster

If you are not running Vagrant 1.7.x or older, then change to the vagrant directory and `vagrant up`:

    vagrant up

### Running Ansible

After provisioning a cluster vith Vagrant you can run ansible in this directory for any additional provisioning -
`ansible.cfg` provides configuration that will allow Ansible to connect to managed hosts.

For example:

    $ ansible -m setup kube-master
    kube-master | SUCCESS => {
        "ansible_facts": {
            "ansible_all_ipv4_addresses": [
                "172.28.128.21",
                "10.0.2.15"
            ],
    ...

Enjoy!.
