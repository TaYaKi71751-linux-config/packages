#!/bin/bash
rm -rf ~/.config/fusuma/
git clone \
	-b config/fusuma \
		https://github.com/raccl/packages.git \
			~/.config/fusuma
