#!/usr/bin/env bash

# Utility script to initialise an NPM project with @solana/web3.js.

set -euo pipefail

# Create an isolated directory to keep the example self-contained.
mkdir -p npm_project
cd npm_project

# Initialise package.json non-interactively, matching the docs' NPM workflow.
npm init -y

# Install the latest web3.js package.
npm install @solana/web3.js

# Drop a short script using the Connection helper from the docs.
cat > index.js <<'EOF'
// Basic TypeScript-like usage compiled down to vanilla JS for the example.
const web3 = require('@solana/web3.js');

async function pingCluster() {
  const connection = new web3.Connection(web3.clusterApiUrl('devnet'));
  const version = await connection.getVersion();
  console.log('Devnet version:', version);
}

pingCluster().catch(console.error);
EOF
