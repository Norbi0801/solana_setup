// Własny serializator zgodny z sekcją "Dodaj własne instrukcje serializatora".
import { BinaryWriter, BinaryReader } from "borsh";

export interface BuilderData {
  mode: number;
  name: string;
}

const textEncoder = new TextEncoder();
const textDecoder = new TextDecoder();

export function encodeBuilder(data: BuilderData): Buffer {
  const writer = new BinaryWriter();
  writer.writeU8(data.mode);
  const nameBytes = textEncoder.encode(data.name);
  writer.writeU32(nameBytes.length);
  writer.writeBuffer(Buffer.from(nameBytes));
  return Buffer.from(writer.buffer);
}

export function decodeBuilder(buffer: Buffer): BuilderData {
  const reader = new BinaryReader(buffer);
  const mode = reader.readU8();
  const nameLength = reader.readU32();
  const nameBytes = reader.readBuffer(nameLength);
  return { mode, name: textDecoder.decode(nameBytes) };
}
