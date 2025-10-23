<!-- Podrozdział "Utwórz logikę instrukcji" -->
# Utwórz logikę instrukcji

- Funkcja `increment_via_cpi` buduje `Instruction` ręcznie i wywołuje ją przez `invoke_signed` z seedami PDA.
- Enum `CalleeInstruction` umożliwia serializację argumentów CPI.
