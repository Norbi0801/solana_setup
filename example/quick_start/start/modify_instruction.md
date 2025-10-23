<!-- Sugestie zmian dla sekcji \"Modyfikacja instrukcji\" -->
# Modyfikacja instrukcji

- Dodaj pola do `GreetingAccount`, zwiększając jednocześnie rozmiar `space` w `#[account(init,...)]`.
- Po zmianie uruchom `anchor build` i przepakuj klienta TypeScript poprzez `anchor run test`, aby odświeżyć wygenerowane IDL.
- Zachowaj kompatybilność, stosując migracje (zob. `example/anchor/migrate_program.sh`).
