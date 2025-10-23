<!-- Przewodnik po podrozdziale \"Weryfikacja\" -->
# Weryfikacja

- Test `updates greeting message` potwierdza wynik instrukcji `update_message` poprzez odczyt konta Anchor.
- Dodatkowo można uruchomić `solana account <pubkey> --output json` dla konta, aby ręcznie potwierdzić dane.
- Zwróć uwagę na wymóg deserializacji Borsh – Anchor robi to automatycznie dzięki IDL.
