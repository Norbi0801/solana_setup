#!/usr/bin/env bash

# Replikuje krok "Zainicjuj nowy projekt" z szybkiego startu.
set -euo pipefail

WORKSPACE_DIR="${WORKSPACE_DIR:-$(pwd)/workspace}"
PROJECT_NAME="${1:-hello_anchor}"

mkdir -p "$WORKSPACE_DIR"
cd "$WORKSPACE_DIR"

anchor init "$PROJECT_NAME"
