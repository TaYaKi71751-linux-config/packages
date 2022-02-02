#!/bin/bash

no_pw_sudo(){
 local CMD="$@"
 printf "\n\n\n" | sudo -S $CMD || echo "ERROR: No permissions to no_pw_sudo"
}
apt_install(){
 local PKG="$@"
 no_pw_sudo "apt-get update -y"
 no_pw_sudo "apt-get install ${PKG} -y"
}

# Install nodejs npm 
apt_install "nodejs"
apt_install "npm"

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# nvm env
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# latest
# nvm install node
# nvm use node
# lts 
nvm install --lts
nvm use --lts
