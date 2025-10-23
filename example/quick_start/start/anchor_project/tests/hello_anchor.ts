// Testy jednostkowe odwzorowujące ćwiczenia z rozdziału \"Szybki start Solana\".
import * as anchor from "@coral-xyz/anchor";
import { Program } from "@coral-xyz/anchor";
import { HelloAnchor } from "../target/types/hello_anchor";

// Test odzwierciedla sekcje "Zbuduj instrukcję transakcji" oraz "Weryfikacja".
describe("hello_anchor", () => {
  const provider = anchor.AnchorProvider.env();
  anchor.setProvider(provider);

  const program = anchor.workspace.HelloAnchor as Program<HelloAnchor>;
  const greetingKeypair = anchor.web3.Keypair.generate();

  it("initializes greeting account", async () => {
    await program.methods
      .initialize("Witaj, Solano!")
      .accounts({
        greeting: greetingKeypair.publicKey,
        authority: provider.wallet.publicKey,
        systemProgram: anchor.web3.SystemProgram.programId,
      })
      .signers([greetingKeypair])
      .rpc();

    const account = await program.account.greetingAccount.fetch(
      greetingKeypair.publicKey
    );
    expect(account.message).toEqual("Witaj, Solano!");
  });

  it("updates greeting message", async () => {
    await program.methods
      .updateMessage("Nowy komunikat")
      .accounts({
        greeting: greetingKeypair.publicKey,
        authority: provider.wallet.publicKey,
      })
      .rpc();

    const account = await program.account.greetingAccount.fetch(
      greetingKeypair.publicKey
    );
    expect(account.message).toEqual("Nowy komunikat");
  });
});
