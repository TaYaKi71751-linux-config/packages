#!/bin/bash

no_pw_sudo(){
 local CMD="$@"
 echo "\n\n\n" | sudo -lS $CMD || echo "ERROR: No permissions to no_pw_sudo"
}

pacman_install(){
 local PKG="$@"
 no_pw_sudo "pacman -Syyu ${PKG} --noconfirm"
}

# Install tailscale script
pacman_install "tailscale"

