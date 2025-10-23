#!/usr/bin/env bash

# Krok "Przetestuj program" – uruchamia testy jednostkowe z solana-program-test.
set -euo pipefail

PROGRAM_DIR="${PROGRAM_DIR:-$(pwd)/program}"

cd "$PROGRAM_DIR"

cargo test
