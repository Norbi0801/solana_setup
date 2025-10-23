#!/usr/bin/env bash

# Ustawienie domyślnego poziomu zatwierdzenia (commitment), które dokument odnosi do numeru slotu.

set -euo pipefail

# W praktyce CLI pozwala konfigurować commitment zamiast slotu.
solana config set --commitment confirmed

# Pokazanie podsumowania konfiguracji umożliwia weryfikację.
solana config get
