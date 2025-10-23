//! Minimalny program Solana z rozdziału "Twój pierwszy program".
use solana_program::{account_info::AccountInfo, entrypoint, entrypoint::ProgramResult, msg, pubkey::Pubkey};

// rejestrujemy funkcję wejścia programu.
entrypoint!(process_instruction);

/// Funkcja przetwarzająca instrukcje przekazane do programu.
pub fn process_instruction(
    _program_id: &Pubkey,
    _accounts: &[AccountInfo],
    instruction_data: &[u8],
) -> ProgramResult {
    // Dokument sugeruje logowanie otrzymanych danych – tu wyświetlamy je w formie UTF-8.
    if let Ok(message) = core::str::from_utf8(instruction_data) {
        msg!("Odebrana wiadomość: {}", message);
    } else {
        msg!("Odebrano dane binarne ({} bajtów)", instruction_data.len());
    }
    Ok(())
}
