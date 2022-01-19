#!/bin/bash
# Install neovim
sudo apt-get install neovim -y
# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Download ".config/nvim/init.vim"
download_file_to_home(){
    local FPATH="$1"
    local FNAME=`echo ${FPATH} | rev | cut -d '/' -f1 | rev`
    echo "$FNAME"
    echo `echo '$FNAME'`
    local FDIR=`echo ${FPATH} | sed s/$FNAME//`
    echo "$FDIR"
    echo "Download $FNAME to $FDIR"
    ls -la "$FDIR" || mkdir -p "$HOME/$FDIR"
    echo "" | tee "$HOME/$FPATH" || rm -rf "$HOME/$FPATH"
    curl -LsSf \
        "https://raw.githubusercontent.com/raccl/packages/ubuntu/$FPATH" \
         -o - | tee "$HOME/$FPATH"
    
}
download_file_to_home ".config/nvim/init.vim"

# Install Plugins
nvim +PlugInstall +qall