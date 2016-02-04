# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure('2') do |config|

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    override.vm_name = 'sculpin'
    provider.ssh_key_name = 'Thinkpad'
    provider.token = ENV['DIGITAL_OCEAN_TOKEN']
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'sfo1'
    provider.size = '512mb'

  end

  # Install required software, dependencies and configurations on the
  # virtual machine using a provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
    #ansible.tags = [ "install"]
    #ansible.tags = [ "build"]
    ansible.tags = [ "run"]
    #ansible.tags = ["delete"]
    ansible.verbose = [ "vvvv"]
  end

end
