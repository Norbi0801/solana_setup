<!-- Wskazówki związane z sekcją \"Zaktualizuj bibliotekę instrukcji\" -->
# Zaktualizuj bibliotekę instrukcji

- Instrukcja `initialize` zapisuje autora i wiadomość w koncie `GreetingAccount`.
- Dodaliśmy instrucję `update_message`, która weryfikuje podpis autora (zob. `CustomError::Unauthorized`).
- Każda zmiana wymaga ponownego uruchomienia `anchor build`, aby odświeżyć IDL.
