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

	config.vm.boot_timeout = 600
	config.vm.provision "shell", inline: <<-SCRIPT
		if [ ! -d /vagrant/provision ]; then
			echo Provision dir NOT FOUND - /vagrant/provision
			echo
			exit 1
		fi

		begin=$( date "+%s" )
		echo
		echo PROVISION - BEG - $( date "+%Y%m%d-%H%M%S" )
		echo ============================================================

		mkdir -p ~/provision

		for file in /vagrant/provision/*.sh; do
			doneFile=~/provision/$( echo $file | sed "s@/@_@g" ).done

			if [ ! -e $doneFile ]; then
				echo
				echo === BEG $file
				begFile=$( date "+%s" )
				if . $file; then
					touch $doneFile

					endFile=$( date "+%s" )
					echo === END $file - $( expr $endFile - $begFile ) s
					echo
				else
					echo
					echo === FAILED $file
					echo
					exit 1
				fi
			else
				echo === FOUND $doneFile
			fi
		done

		end=$( date "+%s" )
		echo
		echo ============================================================
		echo PROVISION - END - $( date "+%Y%m%d-%H%M%S" ) - $( expr $end - $begin ) s

		echo
		echo === REBOOT
		sudo shutdown -r now
	SCRIPT
end
