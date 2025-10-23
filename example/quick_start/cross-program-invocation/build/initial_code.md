<!-- Podrozdział "Kod początkowy" -->
# Kod początkowy

- `programs/callee/src/lib.rs` definiuje konto `Counter` i instrukcje `initialize` oraz `increment`.
- `programs/caller/src/lib.rs` wprowadza instrukcję `increment_via_cpi`, która przygotowuje CPI i przekazuje dane do `callee`.
