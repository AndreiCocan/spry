#!/usr/bin/env bash

set -euoE pipefail

echo "🚀 [homebrew] Installing..."

if command -v brew &> /dev/null; then
  echo "✅ [homebrew] Already Installed."
  return 0
fi

export NONINTERACTIVE=1
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# shellcheck disable=SC2016
if test "$(uname -s)" == "Linux"; then
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc
  source ~/.bashrc
fi

brew analytics off
echo "✅ [homebrew] Installed!"

