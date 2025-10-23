// Implementuje sekcje "Napisz zapytanie niestandardowe" oraz "Dodaj polecenia CLI".
import { Connection, PublicKey } from "@solana/web3.js";

async function fetchAccountData(address: string) {
  const connection = new Connection(process.env.SOLANA_RPC_URL ?? "http://127.0.0.1:8899");
  const pubkey = new PublicKey(address);
  const accountInfo = await connection.getAccountInfo(pubkey, "confirmed");

  if (!accountInfo) {
    console.log("Konto nie istnieje na wybranym klastrze");
    return;
  }

  console.log("Lamporty:", accountInfo.lamports);
  console.log("Dane (hex):", accountInfo.data.toString("hex"));
}

const target = process.argv[2];
if (!target) {
  console.error("Podaj adres konta jako argument");
  process.exit(1);
}

fetchAccountData(target).catch((err) => {
  console.error("Błąd podczas pobierania konta", err);
  process.exit(1);
});
