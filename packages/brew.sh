#!/bin/bash
ORG='TaYaKi71751-linux-config'
REPO='packages'
BRANCH='archlinux'
RAW_DIR='packages'
install_pkg(){
    PKG="$1"
    echo "Install $PKG"
    sh -c "$(curl -LsSf https://raw.githubusercontent.com/${ORG}/${REPO}/${BRANCH}/${RAW_DIR}/${PKG}.sh)"
}
install_pkg "git"

BREW_PATH="${HOME}/.linuxbrew"
if [ -d "${BREW_PATH}" ];then
	git -C "${BREW_PATH}" pull || rm -rf "${BREW_PATH}"
else
	printf ""
fi
[ ! -d "${BREW_PATH}" ] && git clone https://github.com/Homebrew/brew.git ${BREW_PATH}
BREW_BIN="${BREW_PATH}/bin"
brew_shellenv(){
	local SHELLENV_PATH="$1"
	echo "${SHELLENV_PATH}"
	test -d ${BREW_PATH} && eval "$(${BREW_BIN}/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(${BREW_BIN}/brew shellenv)"
	[ ! -z "$(cat ${SHELLENV_PATH} | grep brew)"	] &&\
		echo "Already shellenv in ${SHELLENV_PATH}" && return 0;
	[ -z "$(cat ${SHELLENV_PATH} | grep brew)"	] ||\
		ls ${SHELLENV_PATH} &&\
			echo "eval \"\$($(${BREW_BIN}/brew --prefix)/bin/brew shellenv)\"" >> ${SHELLENV_PATH} &&\
			echo "Set brew shell env to ${SHELLENV_PATH}" && return 0;
}
export PATH="${BREW_BIN}:${PATH}"

for SHELL_NAME in $(cat /etc/shells |\
	cut -d '#' -f1 |\
	rev |\
	cut -d '/' -f1 |\
	rev)
do
	if [ -z "${SHELL_NAME}" ];then
		printf ""
	else
		brew_shellenv "${HOME}/.${SHELL_NAME}rc"
	fi
done
for USER_RC in ${HOME}/.*shrc
do 
	brew_shellenv "${USER_RC}"
done
for USER_PROFILE in ${HOME}/.*profile
do 
	brew_shellenv "${USER_PROFILE}"
done
brew update

