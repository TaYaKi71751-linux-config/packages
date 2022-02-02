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

raw_github(){
 local ORG="$1"
 local REPO="$2"
 local BRANCH="$3"
 local RAW_PATH="$4"
 local OUT_PATH="$5"
	local OUT_DIR=`dirname ${OUT_PATH}`
 local RAW_NAME=`basename ${RAW_PATH}`
 printf "Download ${RAW_NAME} to ${OUT_PATH} from github:${ORG}/${REPO}#${BRANCH}"
 ls -la "$OUT_DIR" &> /dev/null || mkdir -p "${OUT_DIR}" || true
 curl -LsSf \
  "https://raw.githubusercontent.com/${ORG}/${REPO}/${BRANCH}/${RAW_PATH}" \
  -o - | tee "${OUT_PATH}"
}

# Install vim
apt_install "vim"
# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Download ".config/nvim/init.vim"
raw_github 'raccl' 'packages' 'ubuntu' ".vimrc" "${HOME}/.vimrc"

# Install Plugins
vim +PlugInstall +qall
