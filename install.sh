#!/bin/sh
install_pkg(){
    PKG_NAME="$1"
    echo "Install $PKG_NAME"
    sh -c "$(curl -LsSf https://raw.githubusercontent.com/raccl/packages/ubuntu/packages/$PKG_NAME.sh)"
}
install_pkg "tailscale"
install_pkg "nodejs"
install_pkg "zsh"
install_pkg "pacapt"
install_pkg "vim"
install_pkg "neovim"
install_pkg "yarn"
