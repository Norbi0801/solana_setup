#!/usr/bin/env bash

# Update helper derived from the "Aktualizowanie" section of the quick install guide.

set -euo pipefail

# Invoke the unified update command from the official installer.
agave-install update

# Confirm the CLI refreshed to the latest tagged release.
solana --version
