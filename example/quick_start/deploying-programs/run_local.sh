#!/usr/bin/env bash

# Krok "Uruchom program lokalnie" – deploy do lokalnego walidatora.
set -euo pipefail

PROGRAM_SO="${1:-program/target/deploy/first_deploy_program.so}"

solana program deploy "$PROGRAM_SO" --url http://127.0.0.1:8899
