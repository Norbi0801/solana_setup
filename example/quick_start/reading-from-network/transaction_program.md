<!-- Notatki do sekcji "Program transakcyjny" -->
# Program transakcyjny

- Plik `client/src/transaction_program.ts` tworzy transakcję `SystemProgram.transfer` i potwierdza wynik.
- Użyj `npm run start` w połączeniu z `ts-node` albo bezpośrednio `npx ts-node src/transaction_program.ts`.
- Wygenerowane sygnatury przeanalizuj poleceniem `solana confirm <signature>`.
