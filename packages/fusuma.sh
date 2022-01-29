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
  git clone "https://aur.archlinux.org/${PKG}.git" &&
  cd "${HOME}/.aur/${PKG}" &&
  echo "\n\n\n" | makepkg -Si || true &&
  echo "\n\n\n" | makepkg -i --noconfirm || true
}
pacman_install "xdotool"
aur_install "ruby-fusuma"
aur_install "ruby-fusuma-plugin-tap"
aur_install "ruby-fusuma-plugin-wmctrl"
aur_install "ruby-fusuma-plugin-sendkey"
aur_install "ruby-fusuma-plugin-keypress"
aur_install "ruby-fusuma-plugin-appmatcher"
