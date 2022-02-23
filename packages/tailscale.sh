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

which apt-add-repository || apt_install "software-properties-common"
which apt-key || apt_install "apt-key"

OS=$(cat /etc/lsb-release | grep ID | rev | cut -d '=' -f1 | rev | tr '[:upper:]' '[:lower:]')
VERSION=$(cat /etc/lsb-release | grep CODENAME | rev | cut -d '=' -f1 | rev)

# Add keyring
printf "\n\n\n" |\
	sudo -S sh -c "curl -LsSf \
		https://pkgs.tailscale.com/stable/${OS}/${VERSION}.asc |\
			sudo apt-key add -"

# Add repository
printf "\n\n\n" |\
	sudo -S sh -c "curl -fsSL \
		https://pkgs.tailscale.com/stable/${OS}/${VERSION}.list |\
			sudo tee /etc/apt/sources.list.d/tailscale.list"

# Install tailscale
apt_install "tailscale"

