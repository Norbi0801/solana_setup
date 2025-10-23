<!-- Podrozdział "Dodaj konto klienta" -->
# Dodaj konto klienta

- Zmienna `target` w `custom_query.ts` przyjmuje adres konta klienta, np. z `solana-keygen new`.
- Skopiuj publiczny klucz do `.env.local` lub przekaż jako argument CLI.
- Po dodaniu konta porównaj wynik z `solana account`, aby upewnić się, że serializacja jest poprawna.
