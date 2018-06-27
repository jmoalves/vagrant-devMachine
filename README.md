# vagrant-devMachine
A opinionated development machine, using vagrant + ubuntu

Prerequisites
-------------

Before using this ``Vagrantfile``, you must install some tools:
* Vagrant
* VirtualBox

Usage
-----
After cloning this repository, you should issue the commands below:

```
vagrant up
vagrant ssh
```

You may want to add the ``vagrant`` user ssh key to your git repository of choice. The ``Vagrantfile`` creates one at the end.

What's inside?
--------------

I've create this machine to be my primary development machine.

All the items are listed in the ``provision`` directory. Here follows a sample list:
* Oracle Java SE JDK 1.8
* Visual Studio Code
* Eclipse Java EE Edition
* Maven
* JQ
* Google Cloud SDK
* Node.js
* Yarn
* Ionic (+ Cordova)

I've used an ``ubuntu-bionic64`` machine as base. I've also choose the ``VirtualBox`` provider.

However, it should be easy to change these choices. I plan to test it using AWS provider.

BEWARE: Backup
--------------

If it will be your development machine, it is important to backup your files.

I've assumed the following premises:
* We should work inside the virtual machine, as isolated as possible from host machine;
* The ``Vagrantfile`` represents completelly the machine configuration;
* The development files will be source files that can be found in their git repositories.

With these premises in mind, you just need to backup the ``/home/vagrant`` folder once in a while.

For this purpose, there is a ``/backup`` directory inside the guest machine mapped to ``backup/`` directory inside the ``Vagrantfile`` workdir. We also have a cron job running ``rsync`` every hour.

Explaining some decisions
-------------------------

### Public network
I choose the public network because the testing process is easier. Otherwise, the dev machine would have to forward some ports for the running applications.

However, keep in mind that vagrant machines are unsecure by nature. Don't expose them to the real world. Make them public but inside your protected network.
