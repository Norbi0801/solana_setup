#!/usr/bin/env bash

# Odzwierciedla krok "Skonfiguruj program" – ustawiamy BPF target i build-bpf w Anchor CLI.
set -euo pipefail

PROGRAM_DIR="${PROGRAM_DIR:-$(pwd)/program}"

cd "$PROGRAM_DIR"

# Dodajemy narzędzie cargo-build-bpf, które przygotowuje kompilację do BPF.
cargo install --git https://github.com/solana-labs/solana --bin cargo-build-bpf --locked
