#!/usr/bin/env bash

# macOS wrapper executing the documented quick install command.

set -euo pipefail

# Use /bin/bash explicitly because the doc states to run this via the default shell.
/bin/bash -lc "curl --proto '=https' --tlsv1.2 -sSfL https://solana-install.solana.workers.dev | bash"
