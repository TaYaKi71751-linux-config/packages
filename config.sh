#!/bin/bash
rm -rf ~/.config/nvim/
git clone \
	-b config/nvim \
		https://github.com/raccl/packages.git \
			~/.config/nvim
