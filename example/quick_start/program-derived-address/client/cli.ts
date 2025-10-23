// Implementuje sekcję "Wprowadź wiersz poleceń" z podrozdziałami dodawania Program ID, trybu i poleceń Create/Update.
import * as anchor from "@coral-xyz/anchor";
import yargs from "yargs";
import { hideBin } from "yargs/helpers";
import { encodeBuilder } from "./serializer";

const argv = yargs(hideBin(process.argv))
  .command("create", "Tworzy konto PDA", {
    programId: {
      type: "string",
      demandOption: true,
      desc: "Program ID wdrożonego programu",
    },
    mode: {
      type: "number",
      default: 1,
      desc: "Tryb zapisany w BuilderData",
    },
    name: {
      type: "string",
      default: "CLI PDA",
      desc: "Nazwa buildera",
    },
  })
  .command("update", "Aktualizuje konto PDA", {
    programId: {
      type: "string",
      demandOption: true,
    },
    mode: {
      type: "number",
      default: 2,
    },
    name: {
      type: "string",
      default: "CLI update",
    },
  })
  .demandCommand(1)
  .help()
  .parseSync();

async function run() {
  const provider = anchor.AnchorProvider.env();
  anchor.setProvider(provider);

  const programId = new anchor.web3.PublicKey((argv as any).programId);
  const idl = await anchor.Program.fetchIdl(programId, provider);
  if (!idl) {
    throw new Error("IDL not found for program " + programId.toBase58());
  }

  const program = new anchor.Program(idl, programId, provider);
  const [builderPda] = anchor.web3.PublicKey.findProgramAddressSync(
    [Buffer.from("builder"), provider.wallet.publicKey.toBuffer()],
    program.programId
  );

  const command = (argv as any)._?.[0];
  const builderData = {
    mode: (argv as any).mode,
    name: (argv as any).name,
  };

  if (command === "create") {
    await program.methods
      .create(builderData)
      .accounts({
        builder: builderPda,
        authority: provider.wallet.publicKey,
        systemProgram: anchor.web3.SystemProgram.programId,
      })
      .rpc();
    console.log("CLI create signature zapisany w logach");
  } else if (command === "update") {
    await program.methods
      .update(builderData)
      .accounts({
        builder: builderPda,
        authority: provider.wallet.publicKey,
      })
      .rpc();
    console.log("CLI update wysłany");
  }

  // Na potrzeby sekcji "Dodaj własne instrukcje serializatora" pokazujemy zakodowane dane.
  const encoded = encodeBuilder(builderData);
  console.log("Zakodowane dane:", encoded.toString("hex"));
}

run().catch((err) => {
  console.error("CLI execution failed", err);
  process.exit(1);
});
