#!/usr/bin/env bash

# Uruchamia lokalny klaster zgodnie z sekcją "Uruchomienie lokalnego klastra".
set -euo pipefail

solana-test-validator --reset --ledger .local-ledger
