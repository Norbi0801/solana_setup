<!-- Podrozdział "Pokaż wynik Update" -->
# Pokaż wynik Update

- Po aktualizacji pobierz konto `solana account <pda> --output json` i porównaj pole `data` z poprzednim stanem.
- Możesz zastosować `decodeBuilder` z `serializer.ts`, aby przekształcić bufor w czytelne wartości.
