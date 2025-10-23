#!/usr/bin/env bash

# Wdraża program na devnet zgodnie z sekcją "Wdróż program na Devneta".
set -euo pipefail

PROGRAM_SO="${1:-program/target/deploy/first_deploy_program.so}"

solana program deploy "$PROGRAM_SO" --url https://api.devnet.solana.com
