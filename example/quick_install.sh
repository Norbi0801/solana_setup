#!/usr/bin/env bash

# Quick installer mirroring https://solana.com/pl/docs/intro/installation
# Installs Rust, Solana CLI, Anchor CLI, Node.js and Yarn in one step.

set -euo pipefail

# Fetch and execute the official Solana install script over TLS 1.2+.
curl --proto '=https' --tlsv1.2 -sSfL https://solana-install.solana.workers.dev | bash

# After installation, verify every dependency version like the docs recommend.
rustc --version && \
  solana --version && \
  anchor --version && \
  node --version && \
  yarn --version
