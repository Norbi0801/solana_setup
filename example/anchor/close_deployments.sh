#!/usr/bin/env bash

# Zamyka wdrożenia Anchor poprzez anchor close, zgodnie z dokumentacją.

set -euo pipefail

PROJECT_DIR="${1:-$(pwd)/projects/anchor_hello}"

cd "$PROJECT_DIR"

# anchor close usuwa konta programu z klastra wskazanego w konfiguracji.
anchor close
