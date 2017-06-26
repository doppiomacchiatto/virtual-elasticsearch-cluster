# virtual-elasticsearch-cluster

Use [Vagrant](https://www.vagrantup.com/) and [Ansible](https://www.ansible.com)
to quickly set up a multi-host, multi-node ElasticSearch cluster.
Perfect for lightweight ElasticSearch experiments requiring distinct nodes and hosts.

## How to use?

I've included a bash script entitled `install.sh`, to make it trivial to create
the virtual machine cluster. Note I assume you've download
[Vagrant](https://www.vagrantup.com),
[VirtualBox](https://www.virtualbox.org/wiki/VirtualBox),
and
[ansible](https://www.ansible.com)/[ansible-galaxy](https://galaxy.ansible.com/).

1. Clone the git repo with `git clone
   git@github.com:mattjmcnaughton/virtual-elasticsearch-cluster.git`.
2. Set the `install.sh` script to be executable by your user, with `chmod u+x
   install.sh`.
3. Run `install.sh`, with `./install.sh`.
4. Check everything worked with `curl
   http://192.168.2.4:9200/_cluster/health?pretty`. You should see output about
   the health of your virtual ElasticSearch cluster, accessible on
   `http://192.168.2.4:9200`.

## Cluster Details

The [ansible-elasticsearch](https://github.com/elastic/ansible-elasticsearch)
role is highly customizable. I've chosen what I believe are sensible defaults,
but feel free to edit `{Vagrantfile,ansible/inventory,ansible/playbook.yml}` for
further modifications.

The following properties characterize the created cluster:
- Three nodes/hosts: master, master_data, and data
  - master: 192.168.2.4 - a master only node in the cluster. Communicate with
    this node through `http://192.168.2.4:9200`.
  - master_data: 192.168.2.5 - a master data node in the cluster. Can be both a
    master and a data node.
  - data: 192.168.2.6 - a data node in the cluster.
