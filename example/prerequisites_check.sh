#!/usr/bin/env bash

# Pre-flight checker summarising the "Zanim zaczniesz" section of the Solana quick install guide.

set -euo pipefail

# Determine operating system and ensure it matches the supported list.
OS_NAME="$(uname -s)"
case "$OS_NAME" in
  Linux|Darwin|MINGW*|MSYS*)
    echo "Supported OS detected: $OS_NAME"
    ;;
  *)
    echo "Unsupported OS: $OS_NAME" >&2
    exit 1
    ;;
esac

# Confirm CPU architecture is supported (x86_64 or aarch64).
ARCH_NAME="$(uname -m)"
case "$ARCH_NAME" in
  x86_64|amd64|aarch64|arm64)
    echo "Supported architecture detected: $ARCH_NAME"
    ;;
  *)
    echo "Unsupported architecture: $ARCH_NAME" >&2
    exit 1
    ;;
esac

# Verify curl is available for downloading the Solana install script.
if command -v curl >/dev/null 2>&1; then
  echo "curl is available."
else
  echo "curl is required to install Solana CLI from the network." >&2
  exit 1
fi
