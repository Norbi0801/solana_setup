#!/usr/bin/env bash

# Installs Anchor CLI directly via npm/cargo without the Anchor Version Manager.

set -euo pipefail

# Ensure cargo is present for building the binary.
cargo --version

# Install anchor-cli from the official repository with locked dependencies.
cargo install --git https://github.com/coral-xyz/anchor anchor-cli --locked

# Display the installed version.
anchor --version
