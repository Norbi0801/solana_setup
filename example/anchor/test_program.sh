#!/usr/bin/env bash

# Uruchamia zestaw testów Mocha/TypeScript generowanych przez anchor init.

set -euo pipefail

PROJECT_DIR="${1:-$(pwd)/projects/anchor_hello}"

if [ ! -f "$PROJECT_DIR/Anchor.toml" ]; then
  echo "Brak projektu Anchor w $PROJECT_DIR." >&2
  exit 1
fi

cd "$PROJECT_DIR"

# anchor test kompiluje, wdraża do lokalnego klastra i odpala testy.
anchor test
