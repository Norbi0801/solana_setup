// Skrypt odpowiada sekcji "Zainicjuj kontrakt" – wysyła instrukcję z wiadomością.
import { SystemProgram, Transaction, TransactionInstruction } from "@solana/web3.js";
import { getConnection, loadKeypair, getProgramId } from "./common";

async function main() {
  const connection = getConnection();
  const payer = loadKeypair(process.env.SOLANA_KEYPAIR ?? `${process.env.HOME}/.config/solana/id.json`);
  const programId = getProgramId();

  const data = Buffer.from("Hello from client");

  const instruction = new TransactionInstruction({
    programId,
    keys: [],
    data,
  });

  const tx = new Transaction().add(instruction);
  const signature = await connection.sendTransaction(tx, [payer]);
  const latest = await connection.confirmTransaction(signature, "confirmed");

  console.log("Sygnatura inicjalizacji:", signature);
  console.log("Status:", latest); // pokazuje potwierdzenie transakcji.
}

main().catch((err) => {
  console.error("Nie udało się uruchomić inicjalizacji", err);
  process.exit(1);
});
