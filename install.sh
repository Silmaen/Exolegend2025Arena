#!/usr/bin/env bash


# Stop if error
set -e

# installation helpers
function update_package_list() {
    DEBIAN_FRONTEND=noninteractive apt-get update
}

function install_package() {
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y $@
}

# Update package list
update_package_list

install_package unzip
unzip /virtuals-3.0.6-4004acb3.zip
mv /virtuals-3.0.6-4004acb3 /virtuals
rm /virtuals-3.0.6-4004acb3.zip

install_package curl npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
npm install -g serve

ls -l /virtuals

# Clear apt cache
rm -fr /var/cache/apt/archives/* /var/lib/apt/lists/*
