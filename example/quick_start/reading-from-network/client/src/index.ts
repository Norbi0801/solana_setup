// Pokazuje podstawowe użycie Connection wg sekcji "Uruchomienie lokalnego klastra" + "Składanie zapytania RPC".
import { Connection, clusterApiUrl } from "@solana/web3.js";

async function main() {
  const connection = new Connection(clusterApiUrl("devnet"), "confirmed");
  const version = await connection.getVersion();
  console.log("Wersja klastra:", version);
}

main().catch((err) => {
  console.error("Błąd podczas pobierania wersji", err);
  process.exit(1);
});
