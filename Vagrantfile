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
		mkdir -p ~/provision

		for file in /vagrant/provision/*.sh; do
			doneFile=$( echo $file | sed "s@/@_@/g" ).done
			if [ ! -e $doneFile ]; then
				echo
				echo === $file
				. $file

				touch $doneFile
			fi
		done

		echo
		echo === REBOOT
		sudo shutdown -r now
	SCRIPT
end
