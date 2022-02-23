#!/bin/bash

no_pw_sudo(){
 local CMD="$@"
 printf "\n\n\n" | sudo -S $CMD || echo "no_pw_sudo ERROR: ${CMD}"
}
apt_install(){
 local PKG="$@"
 no_pw_sudo "apt-get update -y"
 no_pw_sudo "apt-get install ${PKG} -y"
}

# Install nodejs npm 
apt_install "nodejs"
apt_install "npm"

# Install 
no_pw_sudo "sudo npm install -g n"
# Use node latest version
no_pw_sudo "sudo n latest"

