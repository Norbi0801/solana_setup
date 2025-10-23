#!/usr/bin/env bash

# Wykonuje migrację programu wykorzystując anchor deploy --program-id.

set -euo pipefail

PROJECT_DIR="${1:-$(pwd)/projects/anchor_hello}"
PROGRAM_ID="${PROGRAM_ID:-}"

if [ -z "$PROGRAM_ID" ]; then
  echo "Ustaw zmienną PROGRAM_ID z istniejącym identyfikatorem programu." >&2
  exit 1
fi

cd "$PROJECT_DIR"

# anchor deploy z flagą program-id aktualizuje istniejący program.
anchor deploy --program-id "$PROGRAM_ID"
