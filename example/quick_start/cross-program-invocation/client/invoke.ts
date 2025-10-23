// Klient demonstruje CPI: przygotowuje konto counter programu callee i wywołuje caller.incrementViaCpi.
import * as anchor from "@coral-xyz/anchor";

async function main() {
  const provider = anchor.AnchorProvider.env();
  anchor.setProvider(provider);

  const callerProgram = anchor.workspace.Caller as anchor.Program<any>;
  const calleeProgram = anchor.workspace.Callee as anchor.Program<any>;

  const [counterPda] = anchor.web3.PublicKey.findProgramAddressSync(
    [Buffer.from("counter"), provider.wallet.publicKey.toBuffer()],
    calleeProgram.programId
  );

  // Jeśli konto nie istnieje, zainicjuj je poprzez instrukcję initialize programu callee.
  const accountInfo = await provider.connection.getAccountInfo(counterPda);
  if (!accountInfo) {
    await calleeProgram.methods
      .initialize()
      .accounts({
        counter: counterPda,
        authority: provider.wallet.publicKey,
        systemProgram: anchor.web3.SystemProgram.programId,
      })
      .rpc();
    console.log("Counter PDA initialized by callee program");
  }

  await callerProgram.methods
    .incrementViaCpi(new anchor.BN(5))
    .accounts({
      counter: counterPda,
      authority: provider.wallet.publicKey,
      calleeProgram: calleeProgram.programId,
    })
    .rpc();

  const counter = await calleeProgram.account.counter.fetch(counterPda);
  console.log("Current counter value:", counter.value.toString());
}

main().catch((err) => {
  console.error("CPI invocation failed", err);
  process.exit(1);
});
