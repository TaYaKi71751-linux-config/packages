#!/bin/bash
ORG='raccl'
REPO='packages'
BRANCH='archlinux'
RAW_DIR='packages'
install_pkg(){
 PKG="$1"
 echo "Install $PKG"
 sh -c "$(curl -LsSf https://raw.githubusercontent.com/${ORG}/${REPO}/${BRANCH}/${RAW_DIR}/${PKG}.sh)"
}

no_pw_sudo(){
 local CMD="$@"
 printf "\n\n\n" | sudo -S $CMD || echo "ERROR: No permissions to no_pw_sudo"
}

pacman_install(){
 local PKG="$@"
 no_pw_sudo "pacman -Syyu ${PKG} --noconfirm"
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
 test -d "$OUT_DIR" || mkdir -p "${OUT_DIR}"
 test -d "$OUT_DIR" && curl -LsSf \
  "https://raw.githubusercontent.com/${ORG}/${REPO}/${BRANCH}/${RAW_PATH}" \
  -o - | tee "${OUT_PATH}"
	ls "${OUT_PATH}" 
}

# Install neovim
pacman_install "neovim"
pacman_install "python-pynvim"

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Download ".config/nvim/init.vim"
raw_github 'raccl' 'packages' 'archlinux' ".config/nvim/init.vim" "${HOME}/.config/nvim/init.vim"

# https://github.com/neoclide/coc-snippets/issues/196
# Install python3 pip
pacman_install "python3"
pacman_install "python-pip"
# Install pynvim
python3 -m pip install --user --upgrade pynvim

# Config git core.editor
which git ||\
	install_pkg "git"
	git config --global core.editor nvim
