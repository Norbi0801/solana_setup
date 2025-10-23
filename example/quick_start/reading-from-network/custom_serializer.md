<!-- Podrozdział "Dodaj serializator" -->
# Dodaj serializator

- Zamień `console.log("Dane (hex)")` w `custom_query.ts` na kod używający `borsh`:
  ```ts
  import { deserializeUnchecked } from "borsh";
  ```
  Dzięki temu otrzymasz struktury wysokiego poziomu, co sugeruje przewodnik.
