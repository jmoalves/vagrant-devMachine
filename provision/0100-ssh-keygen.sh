echo === ssh-keygen
yes "" | sudo -u vagrant ssh-keygen -t rsa
sudo -u vagrant cat ~/.ssh/id_rsa.pub

