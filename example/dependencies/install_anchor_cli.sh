#!/usr/bin/env bash

# Install Anchor CLI using npm as highlighted in the dependencies guide.

set -euo pipefail

# Ensure the expected Node runtime is present.
node --version
npm --version

# Install Yarn if it is missing, mirroring the recommended toolchain setup.
if ! command -v yarn >/dev/null 2>&1; then
  npm install --global yarn
fi

# Install the Anchor CLI globally.
npm install --global @coral-xyz/anchor-cli

# Verify the binary was added to the PATH.
anchor --version
