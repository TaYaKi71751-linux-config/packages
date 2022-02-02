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

apt_install "git"
