Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/focal64"
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
		echo
		echo === Workspace
		sudo usermod -aG vboxsf vagrant
		sudo -iu vagrant mkdir -p /media/sf_storage/workspace
		sudo -iu vagrant ln -s /media/sf_storage/workspace ~vagrant/

		echo
		echo === Regional Settings
		sudo timedatectl set-timezone America/Sao_Paulo
		sudo apt-get -y install language-pack-pt

		nexusRepo=http://192.168.15.200:8081/repository/ubuntu-focal/
		nexusStatus=$( curl -o /dev/null -s -w "%{http_code}\n" ${nexusRepo} )	
		if [ $nexusStatus == 200 ]; then
			echo
			echo === Nexus APT Proxy for Ubuntu - ${nexusRepo}
			sudo cp /etc/apt/sources.list /etc/apt/sources.list.orig && \
				cat /etc/apt/sources.list.orig \
				| sed "s@http://archive.ubuntu.com/ubuntu@${nexusRepo}@g" \
				> /etc/apt/sources.list
		fi

		echo
		echo === Updates
		sudo apt-get -y update
		sudo apt-get -y upgrade

		echo
		echo === Gedit + Firefox + X-Windows
		sudo apt-get -y install gedit firefox 

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
