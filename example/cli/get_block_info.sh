#!/usr/bin/env bash

# Pobiera szczegóły bloku, co odpowiada poleceniu z dokumentacji CLI.

set -euo pipefail

# Jeżeli nie podano slotu, pobieramy bieżący najwyższy slot i wyświetlamy jego szczegóły.
SLOT="${1:-$(solana block-height)}"

# solana block <slot> drukuje informacje o konkretnym bloku.
solana block "$SLOT"
