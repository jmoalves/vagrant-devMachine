Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/bionic64"
	config.vm.network "public_network"
	config.ssh.forward_x11 = true
	
	config.vm.synced_folder File.expand_path("~") + "/devMachine", "/storage", id: "storage", create: true, automount: true

	config.vm.provider :virtualbox do |vb|
		vb.name = "vagrant-dev"
		vb.memory = 8192
  		vb.cpus = 4
		vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
	end

	config.vm.provision "shell", inline: <<-SCRIPT
		echo === Workspace
		sudo usermod -aG vboxsf vagrant
		sudo -iu vagrant mkdir -p /media/sf_storage/workspace
		sudo -iu vagrant ln -s /media/sf_storage/workspace ~vagrant/

		echo
		echo === Regional Settings
		sudo timedatectl set-timezone America/Sao_Paulo
		sudo apt-get -y install language-pack-pt

		echo
		echo === Updates
		sudo apt-get -y update
		sudo apt-get -y upgrade

		echo
		echo === Gedit + X-Windows
		sudo apt-get -y install gedit

		for file in /vagrant/provision/*.sh; do
			echo
			echo === $file
			. $file
		done

		echo
		echo === DONE
		sudo shutdown -r now
	SCRIPT
end

