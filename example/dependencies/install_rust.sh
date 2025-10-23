#!/usr/bin/env bash

# Wrapper for installing Rust as described in the dependency guide.

set -euo pipefail

# Run rustup-init with TLS 1.2 enforcement for security.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Refresh PATH so cargo and rustc are immediately available.
source "$HOME/.cargo/env"

# Verify the installation succeeded.
rustc --version
cargo --version
