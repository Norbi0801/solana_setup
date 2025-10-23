<!-- Podrozdział "Zmodyfikuj inicjalizację konta budującego" -->
# Zmodyfikuj inicjalizację konta budującego

- Instrukcja `create` zapisuje `authority` oraz `ctx.bumps["builder"]` jako `bump` do przyszłych walidacji.
- Możesz zwiększyć zakres pola `name` aktualizując `BuilderData::INIT_SPACE`.
