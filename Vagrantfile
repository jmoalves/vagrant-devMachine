Vagrant.configure("2") do |config|
	config.vm.box = "ubuntu/bionic64"

	#if Vagrant.has_plugin?("vagrant-proxyconf")
	#	config.proxy.http     = "http://192.168.15.108:3128/"
	#	config.proxy.https    = "http://192.168.15.108:3128/"
	#	config.proxy.no_proxy = "localhost,127.0.0.1,192.168.15.*"
	#end

  	config.vm.network "public_network"
	config.ssh.forward_x11 = true

	config.vm.synced_folder File.expand_path("~") + "/backup/devMachine", "/backup", create: true

	config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--memory", "8192"]
		vb.customize ["modifyvm", :id, "--cpus", 4]
	end

	config.vm.provision "shell", inline: <<-SCRIPT
		echo === Regional Settings
		sudo timedatectl set-timezone America/Sao_Paulo
		sudo apt-get -y install language-pack-pt

		for file in /vagrant/provision/*.sh; do
			. $file
		done

		sudo apt-get -y update
		sudo apt-get -y upgrade
	SCRIPT
end

