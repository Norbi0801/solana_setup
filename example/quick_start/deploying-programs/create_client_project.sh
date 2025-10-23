#!/usr/bin/env bash

# Automatyzuje krok "Utwórz nowy projekt klienta".
set -euo pipefail

CLIENT_DIR="${CLIENT_DIR:-$(pwd)/client}"

mkdir -p "$CLIENT_DIR"
cd "$CLIENT_DIR"

if [ ! -f package.json ]; then
  npm init -y
fi

echo "Klient Anchor/Web3 gotowy w $CLIENT_DIR (sprawdź package.json)."
