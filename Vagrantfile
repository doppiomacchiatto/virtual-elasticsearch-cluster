# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Base OS configuration
  config.vm.box = 'geerlingguy/ubuntu1604'
  config.ssh.insert_key = false

  # Base VirtualBox configuration
  config.vm.provider :virtualbox do |v|
    v.memory = 1028
    v.cpus = 4
    v.linked_clone = true
    v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    v.customize ['modifyvm', :id, '--ioapic', 'on']
  end

  # Master node
  config.vm.define 'es_master' do |es_master|
    es_master.vm.hostname = 'es-master.dev'
    es_master.vm.network :private_network, ip: '192.168.2.4'
  end

  config.vm.define 'es_master_data' do |es_master_data|
    es_master_data.vm.hostname = 'es-master-data.dev'
    es_master_data.vm.network :private_network, ip: '192.168.2.5'
  end

  config.vm.define 'es_data' do |es_data|
    es_data.vm.hostname = 'es-data.dev'
    es_data.vm.network :private_network, ip: '192.168.2.6'

    es_data.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'ansible/playbook.yml'
      ansible.inventory_path = 'ansible/inventory'
      ansible.limit = 'all'
    end
  end
end
