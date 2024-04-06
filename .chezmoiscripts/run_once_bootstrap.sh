#!/usr/bin/env bash


echo "✨ Lauching spry ✨"
echo "Enter your password to continue..."
# Sudo for silent password prompt later
sudo echo "🔥 Here we goooo... 🔥"

#################################################
###############     HOMEBREW     ################
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
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/bshp/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "✅ [homebrew] Installed!"

brew -v

#################################################
###############      ANSIBLE     ################
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