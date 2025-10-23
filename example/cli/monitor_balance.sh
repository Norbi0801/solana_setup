#!/usr/bin/env bash

# Monitoruje saldo konta, wykorzystując flagę --watch opisaną w tutorialu.

set -euo pipefail

KEYPAIR_PATH="${KEYPAIR_PATH:-$(pwd)/wallet/id.json}"

if [ ! -f "$KEYPAIR_PATH" ]; then
  echo "Brak pliku $KEYPAIR_PATH. Uruchom create_wallet.sh, aby wygenerować portfel." >&2
  exit 1
fi

# Polecenie balansujące pozostaje aktywne i odświeża saldo przy każdej zmianie.
solana balance --keypair "$KEYPAIR_PATH" --watch
