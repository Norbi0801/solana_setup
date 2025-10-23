#!/usr/bin/env bash

# Applies recommended Yarn configuration for Solana/Anchor workflows.

set -euo pipefail

# Set Yarn 1 classic to use the node-modules linker for compatibility.
yarn config set nodeLinker node-modules

# Disable telemetry to avoid unnecessary network calls in CI.
yarn config set enableTelemetry 0

# Extend the network timeout to handle slow artifact downloads.
yarn config set network-timeout 600000
