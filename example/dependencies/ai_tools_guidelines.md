# Wytyczne dotyczące narzędzi AI i kreatorów kodu

- Nie kopiuj do modeli AI kluczy prywatnych ani fraz seed – przewodnik Solana podkreśla ryzyko ich wycieku.
- Przed wysyłką kodu do usług AI usuń dane środowiskowe (`.env`, konfiguracje RPC, tokeny API).
- Włącz lokalne reguły lintingu i testy jednostkowe, aby zweryfikować sugestie AI.
- Monitoruj generowany kod pod kątem przestrzegania najlepszych praktyk bezpieczeństwa programu (np. kontroli właściciela konta, limitów lamportów).
