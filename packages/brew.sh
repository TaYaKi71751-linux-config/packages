#!/bin/sh
# 
# Add user linuxbrew
echo 'Add user linuxbrew'
sudo useradd -mG linuxbrew linuxbrew
# Add user linuxbrew to sudoers list
echo 'Add user linuxbrew to sudoers list'
echo 'linuxbrew ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/linuxbrew-install
# Install linuxbrew to user linuxbrew
echo 'Install linuxbrew to user linuxbrew'

BREW_INSTALL=`curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh" | \
     sed 's/wait_for_user()/wait_four__user()/' | \
      sed 's/wait_for_user//'` # Without wait_for_user
echo "${BREW_INSTALL}" | tee /tmp/BREW_INSTALL.sh
sudo -u linuxbrew /bin/bash /tmp/BREW_INSTALL.sh

# Set brew binary path to /etc/profile.d/brew_bin_path.sh
echo 'Set brew binary path to /etc/profile.d/brew_bin_path.sh'
echo 'export PATH="${PATH}:/home/linuxbrew/.linuxbrew/bin"' | sudo tee /etc/profile.d/brew_bin_path.sh
# Set permission to readable,executable
echo 'Set permission to readable,executable to profile'
sudo chmod 755 /etc/profile.d/brew_bin_path.sh
# Set permission rwxrwxrwx to linuxbrew
echo 'Set permission rwxrwxrwx to linuxbrew'
sudo chmod 777 -R /home/linuxbrew/.linuxbrew/
# Set brew binary path
echo 'Set brew binary path'
export PATH=${PATH}:/home/linuxbrew/.linuxbrew/bin

# Remove user linuxbrew from sudoers list
echo 'Remove user linuxbrew from sudoers list'
sudo rm -rf /etc/sudoers.d/linuxbrew-install
