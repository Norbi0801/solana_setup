// Odpowiada za podrozdział "Program transakcyjny".
import { Connection, Keypair, LAMPORTS_PER_SOL, SystemProgram, Transaction } from "@solana/web3.js";

async function transferLamports() {
  const connection = new Connection(process.env.SOLANA_RPC_URL ?? "http://127.0.0.1:8899", "confirmed");
  const payer = Keypair.generate();
  const recipient = Keypair.generate();

  // Airdrop na rzecz płatnika ułatwia demonstrację.
  const airdropSig = await connection.requestAirdrop(payer.publicKey, LAMPORTS_PER_SOL);
  await connection.confirmTransaction(airdropSig, "confirmed");

  const tx = new Transaction().add(
    SystemProgram.transfer({
      fromPubkey: payer.publicKey,
      toPubkey: recipient.publicKey,
      lamports: 1000,
    })
  );

  const signature = await connection.sendTransaction(tx, [payer]);
  await connection.confirmTransaction(signature, "confirmed");

  console.log("Sygnatura transferu:", signature);
  const recipientBalance = await connection.getBalance(recipient.publicKey);
  console.log("Saldo odbiorcy:", recipientBalance);
}

transferLamports().catch((error) => {
  console.error("Transfer nie powiódł się", error);
  process.exit(1);
});
