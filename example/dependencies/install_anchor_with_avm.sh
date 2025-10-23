#!/usr/bin/env bash

# Installs Anchor CLI using the Anchor Version Manager workflow.

set -euo pipefail

# Install avm from source so it can manage Anchor releases.
cargo install --git https://github.com/coral-xyz/avm --locked avm

# Install the latest published Anchor toolchain via avm.
avm install latest
avm use latest

# Confirm the CLI version now matches the avm-managed release.
anchor --version
