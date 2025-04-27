import * as anchor from "@coral-xyz/anchor";
import { Program } from "@coral-xyz/anchor";
import { SolanaCounter } from "../target/types/solana_counter";

describe("solana_counter", () => {
  const provider = anchor.AnchorProvider.env();
  anchor.setProvider(provider);

  const program = anchor.workspace.SolanaCounter as Program<SolanaCounter>;
  const counterAccount = anchor.web3.Keypair.generate();

  it("Initializes the counter!", async () => {
    await program.methods
      .initialize()
      .accounts({
        counter: counterAccount.publicKey,
        user: provider.wallet.publicKey,
      })
      .signers([counterAccount])
      .rpc();

    const account = await program.account.counter.fetch(
      counterAccount.publicKey,
    );
    console.log(
      "Counter state after initialization:",
      account.count.toString(),
    );
  });

  it("Increments the counter!", async () => {
    await program.methods
      .increment()
      .accounts({
        counter: counterAccount.publicKey,
      })
      .rpc();

    const account = await program.account.counter.fetch(
      counterAccount.publicKey,
    );
    console.log("Counter state after increment:", account.count.toString());
  });
});
