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
