#!/usr/bin/env bash

# Installs the Linux prerequisites outlined in the dependency guide.

set -euo pipefail

sudo apt-get update

# Install build essentials required by Rust and Anchor builds.
sudo apt-get install -y \
  pkg-config \
  build-essential \
  libudev-dev \
  libssl-dev \
  libclang-dev \
  llvm

# Confirm common tools exist.
for bin in cargo rustc clang; do
  if ! command -v "$bin" >/dev/null 2>&1; then
    echo "$bin missing after prerequisite installation" >&2
    exit 1
  fi
done
