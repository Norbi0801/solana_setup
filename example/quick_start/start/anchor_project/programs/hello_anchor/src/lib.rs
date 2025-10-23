use anchor_lang::prelude::*;

// Program demonstruje prostą instrukcję powitalną zgodnie z rozdziałem "Zaktualizuj bibliotekę instrukcji".
#[program]
pub mod hello_anchor {
    use super::*;

    // Instrukcja inicjuje konto GreetingAccount i zapisuje powitanie.
    pub fn initialize(ctx: Context<Initialize>, message: String) -> Result<()> {
        let greeting_account = &mut ctx.accounts.greeting;
        greeting_account.authority = *ctx.accounts.authority.key;
        greeting_account.message = message;
        Ok(())
    }

    // Instrukcja update odwzorowuje sekcję "Modyfikacja instrukcji".
    pub fn update_message(ctx: Context<UpdateMessage>, new_message: String) -> Result<()> {
        let greeting_account = &mut ctx.accounts.greeting;
        require_keys_eq!(greeting_account.authority, ctx.accounts.authority.key(), CustomError::Unauthorized);
        greeting_account.message = new_message;
        Ok(())
    }
}

// Struktura kont bazuje na przykładzie z przewodnika.
#[account]
pub struct GreetingAccount {
    pub authority: Pubkey,
    pub message: String,
}

#[derive(Accounts)]
pub struct Initialize<'info> {
    #[account(init, payer = authority, space = 8 + 32 + 4 + 64)]
    pub greeting: Account<'info, GreetingAccount>,
    #[account(mut)]
    pub authority: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct UpdateMessage<'info> {
    #[account(mut)]
    pub greeting: Account<'info, GreetingAccount>,
    pub authority: Signer<'info>,
}

#[error_code]
pub enum CustomError {
    #[msg("Only the original authority can update the greeting.")]
    Unauthorized,
}
