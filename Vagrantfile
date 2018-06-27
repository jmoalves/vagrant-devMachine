Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/bionic64"

	config.vm.network "public_network"
	config.ssh.forward_x11 = true

	config.vm.synced_folder File.expand_path("~") + "/backup/devMachine", "/backup", create: true

	config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "8192"]
		vb.customize ["modifyvm", :id, "--cpus", 3]
	end

	config.vm.provision "shell", inline: <<-SCRIPT
		sudo apt-get -y update
		sudo apt-get -y upgrade

		for file in /vagrant/provision/*.sh; do
			. $file
		done
	SCRIPT
end

