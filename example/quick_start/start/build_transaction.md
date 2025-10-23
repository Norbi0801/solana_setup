<!-- Odnosi się do rozdziału \"Zbuduj instrukcję transakcji\" -->
# Zbuduj instrukcję transakcji

- W `tests/hello_anchor.ts` metoda `program.methods.initialize` konstruuje instrukcję Anchor.
- Parametr `accounts` mapuje nazwy na klucze publiczne, dokładnie jak w przewodniku.
- Podpis został zapewniony przez `signers([greetingKeypair])`, co daje kontekst do uruchomienia transakcji.
