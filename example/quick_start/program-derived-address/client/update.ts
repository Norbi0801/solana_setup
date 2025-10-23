// Aktualizuje PDA zgodnie z sekcją "Dodaj instrukcję aktualizacji".
import * as anchor from "@coral-xyz/anchor";
import { encodeBuilder } from "./serializer";

const NEW_NAME = process.argv[2] ?? "Zaktualizowany builder";
const NEW_MODE = Number(process.argv[3] ?? 2);

async function main() {
  const provider = anchor.AnchorProvider.env();
  anchor.setProvider(provider);

  const program = anchor.workspace.PdaExample as anchor.Program<any>;
  const [builderPda] = anchor.web3.PublicKey.findProgramAddressSync(
    [Buffer.from("builder"), provider.wallet.publicKey.toBuffer()],
    program.programId
  );

  const data = { mode: NEW_MODE, name: NEW_NAME };

  await program.methods
    .update(data)
    .accounts({
      builder: builderPda,
      authority: provider.wallet.publicKey,
    })
    .rpc();

  console.log("Zaktualizowano PDA:", builderPda.toBase58());
  console.log("Zakodowane dane:", encodeBuilder(data).toString("hex"));
}

main().catch((err) => {
  console.error("Update PDA failed", err);
  process.exit(1);
});
