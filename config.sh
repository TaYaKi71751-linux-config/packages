#!/bin/bash
rm -rf ~/.config/nvim/
git clone \
	-b config/nvim \
		https://github.com/TaYaKi71751-linux-config/packages.git \
			~/.config/nvim
