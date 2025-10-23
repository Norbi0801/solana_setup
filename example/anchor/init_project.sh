#!/usr/bin/env bash

# Tworzy nowy projekt Anchor zgodnie z sekcją „Inicjowanie projektu”.

set -euo pipefail

PROJECT_NAME="${1:-anchor_hello}"
TARGET_DIR="${TARGET_DIR:-$(pwd)/projects}"

# Anchor CLI wymaga pustego katalogu docelowego – tworzymy go na wypadek braku.
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# anchor init generuje szkielet programu w Rust i klienta TypeScript.
anchor init "$PROJECT_NAME"

echo "Projekt utworzony w $TARGET_DIR/$PROJECT_NAME"
