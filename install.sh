#!/bin/sh
ORG='raccl'
REPO='packages'
BRANCH='archlinux'
RAW_DIR='packages'
install_pkg(){
 PKG="$1"
 echo "Install $PKG"
 sh -c "$(curl -LsSf https://raw.githubusercontent.com/${ORG}/${REPO}/${BRANCH}/${RAW_DIR}/${PKG}.sh)"
}
install_pkg "gh-cli"
install_pkg "brew"
install_pkg "tailscale"
install_pkg "zsh"
install_pkg "nodejs"
install_pkg "yarn"
install_pkg "vim"
install_pkg "neovim"
