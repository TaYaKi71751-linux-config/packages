#!/bin/bash


sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh |\
	sed -e 's/unset\ HAVE_SUDO_ACCESS/HAVE_SUDO_ACCESS="false"/g' |\
	sed -e 's/wait_for_user()/_()/g' |\
	sed -e 's/wait_for_user//g')"

brew_shellenv(){
	local SHELLENV_PATH="$1"
	echo "${SHELLENV_PATH}"
	test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	if [[ -z "$(cat ${SHELLENV_PATH} | grep '/bin/brew shellenv')"	]];then
		test -r ~/.bash_profile && echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ${SHELLENV_PATH}
		echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ${SHELLENV_PATH}
	else
		echo "Already shellenv in ${SHELLENV_PATH}"
	fi
}

for USER_RC in ${HOME}/.*shrc
do 
	brew_shellenv "${USER_RC}"
done
for USER_PROFILE in ${HOME}/.*profile
do 
	brew_shellenv "${USER_PROFILE}"
done

