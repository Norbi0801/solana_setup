#!/usr/bin/env bash

# Install the Agave/Solana CLI as instructed in the dependency guide.

set -euo pipefail

# Execute the official installer with forced HTTPS.
sh -c "$(curl --proto '=https' --tlsv1.2 -sSfL https://solana-install.solana.workers.dev)"

# Confirm the CLI binary is available.
solana --version
