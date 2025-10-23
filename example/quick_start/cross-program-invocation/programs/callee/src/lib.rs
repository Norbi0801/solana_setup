use anchor_lang::prelude::*;

// Program "callee" przechowuje licznik wywołań w koncie PDA.
#[program]
pub mod callee {
    use super::*;

    pub fn initialize(ctx: Context<Initialize>) -> Result<()> {
        let counter = &mut ctx.accounts.counter;
        counter.bump = *ctx.bumps.get("counter").ok_or(CalleeError::MissingBump)?;
        counter.value = 0;
        Ok(())
    }

    pub fn increment(ctx: Context<Increment>, amount: u64) -> Result<()> {
        let counter = &mut ctx.accounts.counter;
        counter.value = counter
            .value
            .checked_add(amount)
            .ok_or(CalleeError::Overflow)?;
        Ok(())
    }
}

#[derive(Accounts)]
pub struct Initialize<'info> {
    #[account(
        init,
        payer = authority,
        space = 8 + Counter::INIT_SPACE,
        seeds = [b"counter", authority.key().as_ref()],
        bump,
    )]
    pub counter: Account<'info, Counter>,
    #[account(mut)]
    pub authority: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct Increment<'info> {
    #[account(
        mut,
        seeds = [b"counter", authority.key().as_ref()],
        bump = counter.bump,
    )]
    pub counter: Account<'info, Counter>,
    pub authority: Signer<'info>,
}

#[account]
pub struct Counter {
    pub bump: u8,
    pub value: u64,
}

impl Counter {
    pub const INIT_SPACE: usize = 1 + 8;
}

#[error_code]
pub enum CalleeError {
    #[msg("Bump not available in context")]
    MissingBump,
    #[msg("Counter overflow")]
    Overflow,
}
