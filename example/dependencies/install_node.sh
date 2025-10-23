#!/usr/bin/env bash

# Installs Node.js 18 LTS via nvm, matching the Anchor CLI prerequisites.

set -euo pipefail

if ! command -v nvm >/dev/null 2>&1; then
  # Install nvm if it is missing.
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  # Source nvm script for immediate use.
  # shellcheck disable=SC1090
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
else
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1090
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Install and use the required Node.js version.
nvm install 18
nvm use 18

# Confirm Node and npm versions.
node --version
npm --version
