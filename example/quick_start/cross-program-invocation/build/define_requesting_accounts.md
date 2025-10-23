<!-- Podrozdział "Zdefiniuj konta żądające" -->
# Zdefiniuj konta żądające

- Struktura `IncrementViaCpi` opisuje zestaw kont wymaganych przez CPI: konto licznika, sygnatariusz i ID programu callee.
- Makro `#[account(mut)]` gwarantuje, że licznik zostanie zapisany przez program podrzędny.
