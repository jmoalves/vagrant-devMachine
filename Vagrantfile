Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/bionic64"
	config.ssh.forward_x11 = true
	
	config.vm.synced_folder File.expand_path("~") + "/backup/devMachine", "/backup", create: true, automount: true

	config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "8192"]
		vb.customize ["modifyvm", :id, "--cpus", 4]
	end

	config.vm.provision "shell", inline: <<-SCRIPT
		echo
		echo === Regional Settings
		sudo timedatectl set-timezone America/Sao_Paulo
		sudo apt-get -y install language-pack-pt

		echo
		echo === Major update
		sudo apt-get -y update
		sudo apt-get -y upgrade

		echo
		echo === Gedit + X-Windows
		sudo apt-get -y install gedit

		echo
		echo 
		for file in /vagrant/provision/*.sh; do
			. $file
		done

		echo
		echo === DONE - Restarting
		sudo shutdown -r now
	SCRIPT
end

