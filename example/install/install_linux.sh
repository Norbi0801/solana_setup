#!/usr/bin/env bash

# Linux-specific wrapper that delegates to the official quick install script.

set -euo pipefail

# Run the Solana quick installer exactly as the docs instruct for Linux.
sh -c "$(curl -sSfL https://solana-install.solana.workers.dev)"
