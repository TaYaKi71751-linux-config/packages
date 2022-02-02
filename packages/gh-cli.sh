#!/bin/bash
ORG='raccl'
REPO='packages'
BRANCH='archlinux'
RAW_DIR='packages'
install_pkg(){
 PKG="$1"
 echo "Install $PKG"
 sh -c "$(curl -LsSf https://raw.githubusercontent.com/${ORG}/${REPO}/${BRANCH}/${RAW_DIR}/${PKG}.sh)"
}

no_pw_sudo(){
 local CMD="$@"
 printf "\n\n\n" | sudo -S $CMD || echo "ERROR: No permissions to no_pw_sudo"
}
pacman_install(){
 local PKG="$@"
 no_pw_sudo "pacman -Syyu ${PKG} --noconfirm"
}
install_pkg "git"
pacman_install "github-cli"

