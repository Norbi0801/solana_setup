<!-- Sekcja "Napisz instrukcje klienta" -->
# Napisz instrukcje klienta

- Klient `invoke.ts` wywołuje zarówno program `callee`, jak i `caller`, zapewniając pełny przepływ CPI.
- Skrypt korzysta z `AnchorProvider.env()`, więc wymaga wcześniejszego ustawienia `ANCHOR_WALLET` i `ANCHOR_PROVIDER_URL`.
