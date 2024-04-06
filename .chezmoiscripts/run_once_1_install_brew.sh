#!/usr/bin/env bash

set -euoE pipefail
set -x

echo "🚀 [homebrew] Installing..."

if command -v brew &> /dev/null; then
  echo "✅ [homebrew] Already Installed."
  return 0
fi


bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# shellcheck disable=SC2016
if test "$(uname -s)" == "Linux"; then
  echo "👽️ [homebrew] Exporting path..."
  (echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/bshp/.bashrc
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "✅ [homebrew] Installed!"

