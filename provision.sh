#!/bin/bash

apt-get -y update

# fix possible locale issues
echo "Setting locale..."
echo "# Locale settings
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8">>~/.bashrc

locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales
source ~/.bashrc

# install node
dpkg -s nodejs &>/dev/null || {
	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	apt-get install -y nodejs
	apt-get install -y build-essential

	# ln -s /usr/bin/nodejs /usr/bin/node
}

command -v yo hubot &>/dev/null || {
	npm install -g yo generator-hubot
}


dpkg -s libexpat1-dev &>/dev/null || {
	apt-get install libexpat1-dev
}

cp /vagrant/upstart/myhubot.conf /etc/init/myhubot.conf

sudo -u vagrant -i sh -c 'cd /vagrant/myhubot; npm install'

service myhubot restart
