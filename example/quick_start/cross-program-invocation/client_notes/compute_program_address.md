<!-- Podrozdział "Oblicz adres programowy" -->
# Oblicz adres programowy

- Wywołanie `findProgramAddressSync(["counter", wallet])` tworzy PDA licznika współdzielonego między oboma programami.
- Ten sam seed jest używany w kodzie Rust (zarówno callee, jak i caller), zapewniając spójność.
