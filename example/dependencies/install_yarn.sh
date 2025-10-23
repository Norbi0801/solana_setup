#!/usr/bin/env bash

# Installs Yarn globally via npm as recommended.

set -euo pipefail

# Ensure npm exists before proceeding.
npm --version

# Install Yarn with global scope.
npm install --global yarn

# Print Yarn version for verification.
yarn --version
