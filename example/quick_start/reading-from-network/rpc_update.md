<!-- Sekcja "Aktualizacja RPC i wykonanie" -->
# Aktualizacja RPC i wykonanie

- Uruchom `npm run custom -- <adres>` z różnymi wartościami `SOLANA_RPC_URL`, aby przełączać się między lokalnym a zdalnym klastrem.
- Skrypt `src/remote_rpc.ts` przyjmuje endpoint w pierwszym argumencie, co odzwierciedla instrukcję "Dodaj zdalne bazowe RPC".
- Po zmianie endpointu zawsze weryfikuj saldo poprzez `solana balance` dla tego samego adresu, aby potwierdzić spójność.
