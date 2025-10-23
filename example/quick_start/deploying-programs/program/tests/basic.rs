//! Jednostkowy test hosta symulujący wywołanie programu.
use first_deploy_program::process_instruction;
use solana_program::{instruction::Instruction, pubkey::Pubkey};
use solana_program_test::{processor, ProgramTest};
use solana_sdk::{signature::Keypair, transaction::Transaction};

#[tokio::test]
async fn logs_message() {
    // Przygotowujemy testowy bank z naszym programem.
    let program_id = Pubkey::new_unique();
    let mut program_test = ProgramTest::new(
        "first_deploy_program",
        program_id,
        processor!(process_instruction),
    );

    let (mut banks_client, payer, recent_blockhash) = program_test.start().await;

    // Instrukcja przenosi wiadomość "Hello" w polu data.
    let instruction = Instruction::new_with_bytes(program_id, b"Hello", vec![]);

    let mut transaction = Transaction::new_with_payer(&[instruction], Some(&payer.pubkey()));
    transaction.sign(&[&payer], recent_blockhash);

    banks_client.process_transaction(transaction).await.unwrap();
}
