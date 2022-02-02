#!/bin/bash

no_pw_sudo(){
 local CMD="$@"
 printf "\n\n\n" | sudo -S $CMD || echo "ERROR: No permissions to no_pw_sudo"
}
# Install tailscale script
no_pw_sudo "curl -fsSL https://tailscale.com/install.sh | sh"
