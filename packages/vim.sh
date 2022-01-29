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

# Install vim
pacman_install "vim"
# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Download ".config/nvim/init.vim"
raw_github 'raccl' 'packages' 'archlinux' ".vimrc" "${HOME}"

# Install Plugins
vim +PlugInstall +qall
