#!/usr/bin/env bash

# Krok "Zbuduj program" – używa cargo-build-bpf do kompilacji do formatu .so.
set -euo pipefail

PROGRAM_DIR="${PROGRAM_DIR:-$(pwd)/program}"
OUTPUT_DIR="${OUTPUT_DIR:-target/deploy}"

cd "$PROGRAM_DIR"

cargo build-bpf --manifest-path Cargo.toml --bpf-out-dir "$OUTPUT_DIR"
