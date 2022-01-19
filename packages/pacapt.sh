#!/bin/sh

# Install pacapt
sudo wget -O /usr/local/bin/pacapt \
    https://github.com/icy/pacapt/raw/ng/pacapt
sudo chmod 755 /usr/local/bin/pacapt
sudo cp /usr/local/bin/pacapt /usr/local/bin/pacman || true
# sudo ln -sf /usr/local/bin/pacapt /usr/local/bin/pacapt-tlmgr
# sudo ln -sf /usr/local/bin/pacapt /usr/local/bin/pacapt-conda
# sudo ln -sf /usr/local/bin/pacapt /usr/local/bin/p-tlmgr
# sudo ln -sf /usr/local/bin/pacapt /usr/local/bin/p-conda
