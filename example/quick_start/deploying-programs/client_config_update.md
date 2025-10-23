<!-- Podrozdział "Zmodyfikuj konfigurację klienta" -->
# Zmodyfikuj konfigurację klienta

- Zmień wartość `process.env.FIRST_PROGRAM_ID` w `.env` lub eksporcie powłoki, by wskazywała nowy program.
- W `client/src/common.ts` możesz rozszerzyć `getProgramId`, aby odczytywać ID z `Anchor.toml`.
- Po aktualizacji uruchom ponownie `npm run init`, by upewnić się, że klient korzysta z właściwego programu.
