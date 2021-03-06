#!/bin/bash
#set -e -u
#
mkdir ~/.ssh/
touch ~/.ssh/config
cat <<EOT >> ~/.ssh/config
Host *
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
EOT
#
#eval `ssh-agent -s`
#ssh-add <(echo "${SSH_PRIVATE_KEY}")
#
#git config --global url."ssh://git@git.cto.ai:2224/ops/".insteadOf "https://git.cto.ai/ops/"
export DEBIAN_FRONTEND=noninteractive
apt update
echo 'y' |  apt install apt-utils

echo 'y' |  apt install sshpass

echo "DDD"

sshpass -p ${MAC_STADIUM_PASS} ssh -o stricthostkeychecking=no administrator@207.254.52.154 /Users/administrator/ci_gitlab_script.sh