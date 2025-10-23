<!-- Sekcja "Wdrażanie" -->
# Wdrażanie

- Użyj `deploy_devnet.sh`, aby wysłać program na devnet (`solana program deploy ... --url https://api.devnet.solana.com`).
- Skrypt wymaga wcześniejszego zbudowania artefaktu `.so` za pomocą `build_program.sh`.
- Po wdrożeniu zaktualizuj `FIRST_PROGRAM_ID`, aby klient trafiał w nowy adres.
