#!/usr/bin/env bash

# Konfiguracja domyślnego endpointu JSON RPC zgodnie z dokumentacją Solana CLI.

set -euo pipefail

# Domyślnie korzystamy z devnet, bo przewodnik używa go w kolejnych ćwiczeniach.
solana config set --url https://api.devnet.solana.com

# Wyświetlamy pełną konfigurację, żeby potwierdzić zmianę.
solana config get
