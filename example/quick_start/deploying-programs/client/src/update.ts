// Skrypt odpowiada sekcji "Aktualizuj kontrakt" – wysyła nową wiadomość do programu.
import { Transaction, TransactionInstruction } from "@solana/web3.js";
import { getConnection, loadKeypair, getProgramId } from "./common";

async function update(message: string) {
  const connection = getConnection();
  const payer = loadKeypair(process.env.SOLANA_KEYPAIR ?? `${process.env.HOME}/.config/solana/id.json`);
  const programId = getProgramId();

  const instruction = new TransactionInstruction({
    programId,
    keys: [],
    data: Buffer.from(message),
  });

  const tx = new Transaction().add(instruction);
  const sig = await connection.sendTransaction(tx, [payer]);
  console.log("Sygnatura update:", sig);
  await connection.confirmTransaction(sig, "confirmed");
}

const newMessage = process.argv[2] ?? "Updated message";

update(newMessage).catch((error) => {
  console.error("Aktualizacja nie powiodła się", error);
  process.exit(1);
});
