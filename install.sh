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

install_package cpulimit python3-venv curl psmisc libgl1 libglib2.0-0 libegl1 libxext6 libx11-6 xsel
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
whoami
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
npm install -g serve

# Clear apt cache
rm -fr /var/cache/apt/archives/* /var/lib/apt/lists/*
