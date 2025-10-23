<!-- Podrozdział "Dodaj instrukcję tworzenia" -->
# Dodaj instrukcję tworzenia

- `program.methods.create` przyjmuje obiekt `BuilderData` i tworzy PDA z użyciem seeda `builder` + publiczny klucz użytkownika.
- Kontekst `Create` używa `payer = authority`, aby płacić za nowo zainicjowane konto.
