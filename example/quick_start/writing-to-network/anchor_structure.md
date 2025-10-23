<!-- Podrozdział "Struktura projektu Anchor" -->
# Struktura projektu Anchor

- `programs/<name>/src/lib.rs` – logika on-chain, np. `hello_anchor` z katalogu `start`.
- `Anchor.toml` – mapowanie Program ID na klastry.
- `tests/*.ts` – klient TypeScript wysyłający instrukcje.
