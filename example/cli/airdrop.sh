#!/usr/bin/env bash

# Żąda airdropu SOL na devnecie zgodnie z sekcją tutoriala.

set -euo pipefail

KEYPAIR_PATH="${KEYPAIR_PATH:-$(pwd)/wallet/id.json}"

# Wymuszamy istnienie klucza, bo airdrop potrzebuje adresu docelowego.
if [ ! -f "$KEYPAIR_PATH" ]; then
  echo "Brak pliku $KEYPAIR_PATH. Uruchom najpierw create_wallet.sh." >&2
  exit 1
fi

# Domyślnie prosimy o 1 SOL, ale można nadpisać wartość argumentem.
AMOUNT="${1:-1}"
solana airdrop "$AMOUNT" --keypair "$KEYPAIR_PATH"

# Potwierdzamy operację, pokazując aktualne saldo.
solana balance --keypair "$KEYPAIR_PATH"
