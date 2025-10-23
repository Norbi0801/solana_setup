<!-- Podrozdział "Dodaj polecenia CLI" -->
# Dodaj polecenia CLI

- Dodaj wpis do `package.json`:
  ```json
  "scripts": {
    "account": "ts-node src/custom_query.ts"
  }
  ```
- Uruchom `npm run account -- <adres>`, aby wiernie odwzorować instrukcję z dokumentacji.
