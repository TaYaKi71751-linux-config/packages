#!/bin/sh
# Install neovim
sudo apt-get install neovim -y
# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
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
download_file ".config/nvim/init.vim"

# Install Plugins
nvim +PlugInstall +qall