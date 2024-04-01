#!/bin/bash

no_pw_sudo(){
 local CMD="$@"
 printf "\n\n\n" | sudo -S $CMD || echo "no_pw_sudo ERROR: ${CMD}"
}

pacman_install(){
 local PKG="$@"
 no_pw_sudo "pacman -Syyu ${PKG} --noconfirm"
}


whereis_check(){
 local SEARCH="$@"
 local WHEREIS=$(whereis ${SEARCH})
 local FIRST=$(echo $WHEREIS | cut -d ' ' -f1)
 local SECOND=$(echo $WHEREIS | cut -d ' ' -f2)
 if [ "${FIRST}" == "${SECOND}"  ];then
  return false
 else
  return true
 fi
}

aur_install(){
 local AUR_DIR="${HOME}/.aur"
 local PKG="$@"
 local PKG_DIR="${AUR_DIR}/${PKG}"
 mkdir -p "${AUR_DIR}" || true 
 git --version || pacman_install "git" 
 git clone "https://aur.archlinux.org/${PKG}.git" "${AUR_DIR}/${PKG}" || true
 cd "${HOME}/.aur/${PKG}"
 git pull --rebase
 if [ whereis_check "makepkg" == false ];then
  exit -1
 else 
  echo "\n\n\n" | makepkg -Scfi
  echo "\n\n\n" | makepkg -sCi --noconfirm 
  yay -S "${PKG}" --noconfirma
 fi
}
raw_github(){
 local ORG="$1"
 local REPO="$2"
 local BRANCH="$3"
 local RAW_PATH="$4"
 local OUT_DIR="$5"
 local RAW_NAME=`echo ${RAW_PATH} | rev | cut -d '/' -f1 | rev`
 local OUT_PATH="${OUT_DIR}/${RAW_NAME}"
 echo "Download ${RAW_NAME} to ${OUT_PATH} from github:${ORG}/${REPO}\#${BRANCH}"
 local DIR=$(ls -la "$OUT_DIR" || mkdir -p "${OUT_DIR}")
 echo "${DIR}"
 curl -LsSf \
  "https://raw.githubusercontent.com/${ORG}/${REPO}/${BRANCH}/${RAW_PATH}" \
  -o - | tee "${OUT_PATH}"
}

pacman_install "xdotool"
aur_install "ruby-fusuma"
aur_install "ruby-fusuma-plugin-tap"
aur_install "ruby-fusuma-plugin-wmctrl"
aur_install "ruby-fusuma-plugin-sendkey"
aur_install "ruby-fusuma-plugin-keypress"
aur_install "ruby-fusuma-plugin-appmatcher"

# Download Config
FUSUMA_CFG_DIR='.config/fusuma'
raw_github 'TaYaKi71751-linux-config' 'packages' 'archlinux' "${FUSUMA_CFG_DIR}/config.yml" "${HOME}/${FUSUMA_CFG_DIR}"

# Add User to Group input
no_pw_sudo "usermod -aG input $USER || echo "Error: during Add user \'$USER\' to group \'input\'"" 

echo '$(which fusuma) -d & ' | sudo tee /etc/profile.d/fusuma.sh # Add Fusuma to Startup
