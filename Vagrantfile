Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/focal64"
	#config.vm.network "public_network"
	config.ssh.forward_x11 = true

	config.vbguest.auto_update = true

	config.vm.synced_folder File.expand_path("~") + "/devMachine", "/storage", id: "storage", create: true, automount: true

	config.vm.provider :virtualbox do |vb|
		vb.name = "vagrant-dev"
		vb.memory = 8192
  		vb.cpus = 4
		vb.gui = true

		vb.customize ["modifyvm", :id, 
			"--clipboard", "bidirectional", 
			"--draganddrop", "bidirectional",
			"--graphicscontroller", "vmsvga"
		]

		vb.customize ["storageattach", :id, 
			"--storagectl", "IDE", 
			"--port", "0", "--device", "0", 
			"--type", "dvddrive", 
			"--medium", "emptydrive"
		]
	end

	config.vm.boot_timeout = 600
	config.vm.provision "shell", inline: <<-SCRIPT
		. /vagrant/provision.sh

		echo
		echo === REBOOT
		sudo shutdown -r now
	SCRIPT
end
