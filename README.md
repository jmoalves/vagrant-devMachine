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
