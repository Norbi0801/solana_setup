<!-- Podrozdział "Zdefiniuj typ konta budującego" -->
# Zdefiniuj typ konta budującego

- Struktura `Builder` przechowuje `authority`, `bump` i zserializowane dane `BuilderData`.
- Makro `#[account(init, seeds = [b"builder", authority.key().as_ref()], bump)]` zapewnia deterministyczny adres.
