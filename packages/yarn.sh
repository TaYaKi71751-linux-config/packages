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
  git pull --rebase && 
  cd "${HOME}/.aur/${PKG}" &&
  echo "\n\n\n" | makepkg -Si || true &&
  echo "\n\n\n" | makepkg -i --noconfirm || true
}

# Install yarn
pacman_install 'yarn'
