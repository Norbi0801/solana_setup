#!/usr/bin/env bash

# Krok "Zbuduj klienta" – instaluje zależności i kompiluje TypeScript.
set -euo pipefail

CLIENT_DIR="${CLIENT_DIR:-$(pwd)/client}"

cd "$CLIENT_DIR"

npm install

# Sprawdzenie, czy pliki TS kompilują się bez wysyłania transakcji.
npx tsc --noEmit
