<!-- Podrozdział "Struktura" -->
# Struktura

- `program/Cargo.toml` – definiuje wersję Rust i zależność `solana-program`.
- `program/src/lib.rs` – funkcja `process_instruction` loguje dane instrukcji, co odpowiada przykładowi z dokumentacji.
- Program spełnia wymagania `cdylib` umożliwiające kompilację do BPF.
