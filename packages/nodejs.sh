#!/bin/bash

no_pw_sudo(){
 local CMD="$@"
 echo "\n\n\n" | sudo -lS $CMD || echo "ERROR: No permissions to no_pw_sudo"
}
pacman_install(){
 local PKG="$@"
 no_pw_sudo "pacman -Syyu ${PKG} --noconfirm"
}
aur_install(){
 local PKG="$@"
 mkdir -p "${HOME}/.aur" || true &&
  cd "${HOME}/.aur" &&
  git -v || pacman_install "git" && 
  git clone "https://aur.archlinux.org/${PKG}.git" || true &&
  cd "${HOME}/.aur/${PKG}" &&
  git pull --rebase && 
  echo "\n\n\n" | makepkg -Si || true &&
  echo "\n\n\n" | makepkg -i --noconfirm || true
}

# Install nodejs npm 
pacman_install "nodejs"
pacman_install "npm"

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
