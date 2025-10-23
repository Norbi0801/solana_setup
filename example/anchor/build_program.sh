#!/usr/bin/env bash

# Buduje program Anchor, co odpowiada sekcji „Budowanie programu”.

set -euo pipefail

PROJECT_DIR="${1:-$(pwd)/projects/anchor_hello}"

if [ ! -f "$PROJECT_DIR/Anchor.toml" ]; then
  echo "Nie znaleziono Anchor.toml w $PROJECT_DIR. Uruchom init_project.sh." >&2
  exit 1
fi

cd "$PROJECT_DIR"

# anchor build kompiluje program Rust i generuje IDL.
anchor build
