<!-- Podrozdział "Dodaj instrukcję aktualizacji" -->
# Dodaj instrukcję aktualizacji

- Funkcja `update` weryfikuje podpis `authority` i przypisuje nowe wartości `BuilderData`.
- `has_one = authority` w makro konta gwarantuje, że tylko właściciel PDA może modyfikować dane.
