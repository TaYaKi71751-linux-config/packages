#!/bin/sh

# Install pacapt
sudo wget -O /usr/local/bin/pacapt \
    https://github.com/icy/pacapt/raw/ng/pacapt
sudo chmod 755 /usr/local/bin/pacapt
sudo ln -sv /usr/local/bin/pacapt /usr/local/bin/pacman || true
ln -s /usr/local/bin/pacapt /usr/local/bin/pacapt-tlmgr
ln -s /usr/local/bin/pacapt /usr/local/bin/pacapt-conda
ln -s /usr/local/bin/pacapt /usr/local/bin/p-tlmgr
ln -s /usr/local/bin/pacapt /usr/local/bin/p-conda
