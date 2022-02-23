#!/bin/bash

no_pw_sudo(){
 local CMD="$@"
 printf "\n\n\n" | sudo -S $CMD || echo "no_pw_sudo ERROR: ${CMD}"
}
pacman_install(){
 local PKG="$@"
 no_pw_sudo "pacman -Syyu ${PKG} --noconfirm"
}

# Install nodejs npm 
pacman_install "nodejs"
pacman_install "npm"

# Install 
no_pw_sudo "sudo npm install -g n"
# Use node latest version
no_pw_sudo "sudo n latest"

