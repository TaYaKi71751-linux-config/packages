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

raw_github(){
 local ORG="$1"
 local REPO="$2"
 local BRANCH="$3"
 local RAW_PATH="$4"
 local OUT_DIR="$5"
 local RAW_NAME=`echo ${RAW_PATH} | rev | cut -d '/' -f1 | rev`
 local OUT_PATH="${OUT_DIR}/${RAW_NAME}"
 echo "Download ${RAW_NAME} to ${OUT_PATH} from github:${ORG}/${REPO}\#${BRANCH}"
 local DIR=$(ls -la "$OUT_DIR" || mkdir -p "${OUT_DIR}")
 echo "${DIR}"
 curl -LsSf \
  "https://raw.githubusercontent.com/${ORG}/${REPO}/${BRANCH}/${RAW_PATH}" \
  -o - | tee "${OUT_PATH}"
}

pacman_install "xdotool"
aur_install "ruby-fusuma"
aur_install "ruby-fusuma-plugin-tap"
aur_install "ruby-fusuma-plugin-wmctrl"
aur_install "ruby-fusuma-plugin-sendkey"
aur_install "ruby-fusuma-plugin-keypress"
aur_install "ruby-fusuma-plugin-appmatcher"
FUSUMA_CFG_DIR='.config/fusuma'
raw_github 'raccl' 'packages' 'archlinux' "${FUSUMA_CFG_DIR}/config.yml" "${HOME}/${FUSUMA_CFG_DIR}"
