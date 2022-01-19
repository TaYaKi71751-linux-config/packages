#!/bin/sh
# Install neovim
sudo apt-get install vim -y
# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Download ".config/nvim/init.vim"
download_file(){
    FILE_PATH="$1"
    echo "Download $FILE_PATH"
    mkdir -p "~/$FILE_PATH"
    rm -rf "~/$FILE_PATH"
    curl -LsSf \
        "https://raw.githubusercontent.com/raccl/packages/ubuntu/$FILE_PATH" \
         -o "$HOME/$FILE_PATH"
}
download_file ".vimrc"

# Install Plugins
vim +PlugInstall +qall