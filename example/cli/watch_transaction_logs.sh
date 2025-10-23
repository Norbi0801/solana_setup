#!/usr/bin/env bash

# Strumieniuje logi transakcji, co pokazuje jak śledzić wykonanie programu.

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Użycie: $0 <transakcja_signature>" >&2
  exit 1
fi

SIGNATURE="$1"

# solana logs będzie tailował wpisy dla podanej transakcji.
solana logs "$SIGNATURE"
