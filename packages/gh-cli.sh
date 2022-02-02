#!/bin/bash
ORG='raccl'
REPO='packages'
BRANCH='ubuntu'
RAW_DIR='packages'
install_pkg(){
 PKG="$1"
 echo "Install $PKG"
 sh -c "$(curl -LsSf https://raw.githubusercontent.com/${ORG}/${REPO}/${BRANCH}/${RAW_DIR}/${PKG}.sh)"
}
no_pw_sudo(){
 local CMD="$@"
 printf "\n\n\n" | sudo -S $CMD || echo "ERROR: No permissions to no_pw_sudo"
}
apt_install(){
 local PKG="$@"
 no_pw_sudo "apt-get update -y"
 no_pw_sudo "apt-get install ${PKG} -y"
}
APT_TRUSTED="/etc/apt/trusted.gpg.d"
GH_CLI_GPG="githubcli-archive-keyring.gpg"
no_pw_sudo "curl -fsSL https://cli.github.com/packages/${GH_CLI_GPG} -o ${APT_TRUSTED}/${GH_CLI_GPG}"
APT_SOURCE_LIST="/etc/apt/sources.list.d"
APT_SOURCE="deb [arch=$(dpkg --print-architecture) signed-by=${APT_TRUSTED}/${GH_CLI_GPG}] https://cli.github.com/packages stable main"
TMP_DATE="$(date +%s)"
echo "${APT_SOURCE}" > /tmp/${TMP_DATE}_github-cli.list
no_pw_sudo "cp /tmp/${TMP_DATE}_github-cli.list ${APT_SOURCE_LIST}/github-cli.list"
install_pkg "git"
apt_install "gh"

