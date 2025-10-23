// Tworzy konto PDA używając Anchor workspace.
import * as anchor from "@coral-xyz/anchor";
import { encodeBuilder } from "./serializer";

async function main() {
  const provider = anchor.AnchorProvider.env();
  anchor.setProvider(provider);

  const program = anchor.workspace.PdaExample as anchor.Program<any>;

  const [builderPda] = anchor.web3.PublicKey.findProgramAddressSync(
    [Buffer.from("builder"), provider.wallet.publicKey.toBuffer()],
    program.programId
  );

  const data = { mode: 1, name: "Demo" };

  await program.methods
    .create(data)
    .accounts({
      builder: builderPda,
      authority: provider.wallet.publicKey,
      systemProgram: anchor.web3.SystemProgram.programId,
    })
    .rpc();

  console.log("Utworzono PDA:", builderPda.toBase58());
  console.log("Zakodowane dane:", encodeBuilder(data).toString("hex"));
}

main().catch((err) => {
  console.error("Create PDA failed", err);
  process.exit(1);
});
