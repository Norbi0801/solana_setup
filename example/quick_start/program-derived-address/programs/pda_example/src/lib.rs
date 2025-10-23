use anchor_lang::prelude::*;

// Kod bazowy odwzorowuje rozdział "Program Derived Address".
#[program]
pub mod pda_example {
    use super::*;

    /// Tworzy nowe konto buildera powiązane z PDA.
    pub fn create(ctx: Context<Create>, data: BuilderData) -> Result<()> {
        let builder = &mut ctx.accounts.builder;
        builder.authority = ctx.accounts.authority.key();
        builder.bump = *ctx.bumps.get("builder").ok_or(CustomError::MissingBump)?;
        builder.data = data;
        Ok(())
    }

    /// Aktualizuje istniejące konto buildera.
    pub fn update(ctx: Context<Update>, data: BuilderData) -> Result<()> {
        let builder = &mut ctx.accounts.builder;
        require_keys_eq!(builder.authority, ctx.accounts.authority.key(), CustomError::Unauthorized);
        builder.data = data;
        Ok(())
    }
}

#[derive(Accounts)]
pub struct Create<'info> {
    #[account(
        init,
        payer = authority,
        space = 8 + Builder::INIT_SPACE,
        seeds = [b"builder", authority.key().as_ref()],
        bump,
    )]
    pub builder: Account<'info, Builder>,
    #[account(mut)]
    pub authority: Signer<'info>,
    pub system_program: Program<'info, System>,
}

#[derive(Accounts)]
pub struct Update<'info> {
    #[account(
        mut,
        seeds = [b"builder", authority.key().as_ref()],
        bump = builder.bump,
        has_one = authority,
    )]
    pub builder: Account<'info, Builder>,
    #[account(mut)]
    pub authority: Signer<'info>,
}

#[account]
pub struct Builder {
    pub authority: Pubkey,
    pub bump: u8,
    pub data: BuilderData,
}

impl Builder {
    pub const INIT_SPACE: usize = 32 + 1 + BuilderData::INIT_SPACE;
}

#[derive(AnchorSerialize, AnchorDeserialize, Clone, Default)]
pub struct BuilderData {
    pub mode: u8,
    pub name: String,
}

impl BuilderData {
    pub const INIT_SPACE: usize = 1 + 4 + 32; // mode + name (max 32 znaków)
}

#[error_code]
pub enum CustomError {
    #[msg("Only the authority can update this builder.")]
    Unauthorized,
    #[msg("Missing PDA bump in context.")]
    MissingBump,
}
