#!/bin/bash

# Update packages, set frontend to "noninteractive" so we don't get any questions
apt-get update -qy

# Install required softwares and repos
apt-get install -y --no-install-recommends apt-utils
apt-get install -y rsync ssh curl software-properties-common wget
add-apt-repository ppa:ondrej/php -y
apt-get install -y php$PHP_VERSION php-pear phpunit php$PHP_VERSION-dev libz-dev zip unzip

# Install Google Cloud SDK
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
apt-get update -qy
apt-get install -y google-cloud-sdk

# Install GRPC (mostly for Google Cloud requirements)
pecl install grpc
echo "extension=grpc.so" > /etc/php/$PHP_VERSION/cli/conf.d/25-grpc.ini

# Create the .ssh directory
mkdir -p ~/.ssh

# Install NVM
curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
