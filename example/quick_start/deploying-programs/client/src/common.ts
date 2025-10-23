// Wspólne helpery dla skryptów inicjujących/aktualizujących kontrakt z przewodnika.
import { Connection, Keypair, PublicKey, clusterApiUrl } from "@solana/web3.js";
import { readFileSync } from "fs";

export function getConnection(): Connection {
  const url = process.env.SOLANA_RPC_URL ?? clusterApiUrl("devnet");
  return new Connection(url, "confirmed");
}

export function loadKeypair(path: string): Keypair {
  const secret = JSON.parse(readFileSync(path, "utf-8"));
  return Keypair.fromSecretKey(new Uint8Array(secret));
}

export function getProgramId(): PublicKey {
  const id = process.env.FIRST_PROGRAM_ID ?? "11111111111111111111111111111111";
  return new PublicKey(id);
}
