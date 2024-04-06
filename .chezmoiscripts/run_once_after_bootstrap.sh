#!/usr/bin/env bash

echo "✨ Lauching spry ✨"
echo "Enter your password to continue..."
# Sudo for silent password prompt later
sudo echo "🔥 Here we goooo... 🔥"

#################################################
###############  HOMEBREW INSTALL  ##############
#################################################

echo "🚀 [homebrew] Installing..."

if command -v brew &> /dev/null; then
  echo "✅ [homebrew] Already Installed."
  return 0
fi

NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# shellcheck disable=SC2016
if test "$(uname -s)" == "Linux"; then
  echo "👽️ [homebrew] Exporting path..."
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
fi

echo "✅ [homebrew] Installed!"

brew -v

#################################################
################  ANSIBLE INSTALL  ##############
#################################################

echo "🚀 [ansible] Installing..."

if command -v ansible-playbook &> /dev/null; then
  echo "✅ [ansible] Already Installed."

  return 0
fi

brew install ansible

echo "🚀 [ansible] Installing Collections..."
ansible-galaxy collection install community.general

echo "✅ [ansible] Installed!"

#################################################
###############   PLAYBOOK RUN   ################
#################################################

cwd="$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)"

sudo_required() { 
  sudo -n true 2>/dev/null || return 0; 
}

echo "🚀 [ansible] Running Playbook..."
local playbook_opts=()

if sudo_required; then
  playbook_opts+=("--ask-become-pass")
fi

ansible-playbook -e "ansible_user=$(whoami)" ".colonizr/main.yaml" -v "${playbook_opts[*]}"
echo "✅ [ansible] Configured!"


