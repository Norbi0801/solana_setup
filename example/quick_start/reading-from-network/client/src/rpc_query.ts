// Realizuje podsekcje "Skompiluj i uruchom" oraz "Pokaż wynik" dla zapytania RPC.
import { Connection, clusterApiUrl } from "@solana/web3.js";

async function queryLatestBlock() {
  const connection = new Connection(clusterApiUrl("devnet"));
  const slot = await connection.getSlot();
  const block = await connection.getBlock(slot);
  console.log("Odczytany slot:", slot);
  console.dir(block, { depth: 2 });
}

queryLatestBlock().catch((error) => {
  console.error("Nie udało się pobrać bloku", error);
  process.exit(1);
});
