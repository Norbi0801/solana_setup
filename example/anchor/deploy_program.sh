#!/usr/bin/env bash

# Wdraża program na wskazany klaster według sekcji „Wdrażanie programu”.

set -euo pipefail

PROJECT_DIR="${1:-$(pwd)/projects/anchor_hello}"
CLUSTER="${CLUSTER:-devnet}"

if [ ! -f "$PROJECT_DIR/Anchor.toml" ]; then
  echo "Nie znaleziono projektu Anchor w $PROJECT_DIR." >&2
  exit 1
fi

cd "$PROJECT_DIR"

# anchor deploy używa konfiguracji w Anchor.toml (w tym kluczy i endpointu).
anchor deploy --provider.cluster "$CLUSTER"
