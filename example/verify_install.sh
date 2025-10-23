#!/usr/bin/env bash

# Version check helper mirroring the "Weryfikacja instalacji" step.

set -euo pipefail

# Print tool versions to confirm every dependency is reachable.
rustc --version
solana --version
anchor --version
node --version
yarn --version
