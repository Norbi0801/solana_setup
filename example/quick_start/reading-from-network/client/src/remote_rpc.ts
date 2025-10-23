// Obsługuje sekcję "Dodaj zdalne bazowe RPC" oraz "Aktualizacja RPC i wykonanie".
import { Connection } from "@solana/web3.js";

async function printRemoteBalance(endpoint: string, address: string) {
  const { PublicKey } = await import("@solana/web3.js");
  const connection = new Connection(endpoint, "confirmed");
  const balance = await connection.getBalance(new PublicKey(address));
  console.log(`Saldo konta ${address} na ${endpoint}:`, balance);
}

const endpoint = process.argv[2];
const address = process.argv[3];

if (!endpoint || !address) {
  console.error("Użycie: ts-node src/remote_rpc.ts <endpoint> <address>");
  process.exit(1);
}

printRemoteBalance(endpoint, address).catch((error) => {
  console.error("Niepowodzenie zapytania do zdalnego RPC", error);
  process.exit(1);
});
