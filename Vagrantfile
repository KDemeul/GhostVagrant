# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
 
  # Kick off bootstrap script
  config.vm.provision :shell, :path => "bootstrap.sh"


  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. If you're using either port a new one will be autoatically used.
  config.vm.network :forwarded_port, guest: 2368, host: 1234, auto_correct: true

end
