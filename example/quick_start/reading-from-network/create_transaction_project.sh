#!/usr/bin/env bash

# Automatyzuje krok "Utwórz nowy projekt" dla programu transakcyjnego.
set -euo pipefail

PROJECT_ROOT="${PROJECT_ROOT:-$(pwd)/transaction-program}";

mkdir -p "$PROJECT_ROOT/src"
cat >"$PROJECT_ROOT/Cargo.toml" <<'TOML'
[package]
name = "transaction_program"
version = "0.1.0"
edition = "2021"

[dependencies]
solana-program = "1.18.0"
TOML

cat >"$PROJECT_ROOT/src/lib.rs" <<'RS'
//! Minimalny program transakcyjny wypisujący komunikat w logach.
use solana_program::{account_info::AccountInfo, entrypoint, entrypoint::ProgramResult, msg, pubkey::Pubkey};

entrypoint!(process_instruction);

pub fn process_instruction(
    _program_id: &Pubkey,
    _accounts: &[AccountInfo],
    _instruction_data: &[u8],
) -> ProgramResult {
    msg!("Transakcyjny program został wywołany");
    Ok(())
}
RS

echo "Projekt Rust utworzony w $PROJECT_ROOT"
