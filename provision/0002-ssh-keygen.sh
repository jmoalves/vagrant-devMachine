echo === ssh-keygen
yes "" | sudo -u vagrant ssh-keygen -t rsa

echo
sudo -u vagrant cat /home/vagrant/.ssh/id_rsa.pub
