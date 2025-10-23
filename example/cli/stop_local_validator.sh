#!/usr/bin/env bash

# Zatrzymuje lokalnego validatora uruchomionego przez start_local_validator.sh.

set -euo pipefail

# solana-test-validator nie ma osobnej komendy stop. Ubijamy proces po nazwie.
pkill -f solana-test-validator

echo "Lokalny validator został zatrzymany (jeśli proces istniał)."
