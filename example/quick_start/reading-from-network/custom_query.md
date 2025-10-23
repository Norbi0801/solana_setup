<!-- Sekcja "Napisz zapytanie niestandardowe" -->
# Napisz zapytanie niestandardowe

- Edytuj `client/src/custom_query.ts`, aby serializować dane przy pomocy Borsh lub JSON.
- Dodaj serializator w miejscu, gdzie aktualnie wypisujemy bufor w formacie hex (`accountInfo.data`).
- Rozszerz skrypt o parser CLI (np. yargs), aby akceptować dodatkowe parametry filtrów.
