#!/bin/bash

no_pw_sudo(){
 local CMD="$@"
 printf "\n\n\n" | sudo -S $CMD || echo "no_pw_sudo ERROR: ${CMD}"
}

pacman_install(){
 local PKG="$@"
 no_pw_sudo "pacman -Syyu ${PKG} --noconfirm"
}

whereis_check(){
 local SEARCH="$@"
 local WHEREIS=$(whereis ${SEARCH})
 local FIRST=$(echo $WHEREIS | cut -d ' ' -f1)
 local SECOND=$(echo $WHEREIS | cut -d ' ' -f2)
 if [ "${FIRST}" == "${SECOND}"  ];then
  return false
 else
  return true
 fi
}

aur_install(){
 local AUR_DIR="${HOME}/.aur"
 local PKG="$@"
 local PKG_DIR="${AUR_DIR}/${PKG}"
 mkdir -p "${AUR_DIR}" || true 
 git --version || pacman_install "git" 
 git clone "https://aur.archlinux.org/${PKG}.git" "${AUR_DIR}/${PKG}" || true
 cd "${HOME}/.aur/${PKG}"
 git pull --rebase
 if [ whereis_check "makepkg" == false ];then
  exit -1
 else 
  echo "\n\n\n" | makepkg -Scfi
  echo "\n\n\n" | makepkg -sCi --noconfirm 
  yay -S "${PKG}" --noconfirma
 fi
}
pacman_install 'base-devel'
pacman_install 'go'
aur_install 'yay'
