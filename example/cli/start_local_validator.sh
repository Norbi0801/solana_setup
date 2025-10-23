#!/usr/bin/env bash

# Startuje lokalny validator Solana tak jak w przewodniku CLI.

set -euo pipefail

# Używamy solana-test-validator, który zapewnia wbudowane konta i faucet.
solana-test-validator --reset
