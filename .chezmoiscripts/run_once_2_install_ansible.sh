#!/bin/bash

echo "🚀 [ansible] Installing..."

if command -v ansible-playbook &> /dev/null; then
  echo "✅ [ansible] Already Installed."

  return 0
fi

brew install ansible

echo "🚀 [ansible] Installing Collections..."
ansible-galaxy collection install community.general

echo "✅ [ansible] Installed!"