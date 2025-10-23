<!-- Instrukcje dla sekcji \"Wykonaj transakcję\" -->
# Wykonaj transakcję

- Skrypt testowy Anchor uruchamia transakcję RPC poprzez `provider.sendAndConfirm` ukryte w `program.methods.*.rpc()`.
- Po wdrożeniu możesz także użyć `anchor run test`, aby uzyskać sygnatury transakcji w logach.
- Zebrane sygnatury wykorzystaj w `example/cli/watch_transaction_logs.sh`, by analizować logi.
