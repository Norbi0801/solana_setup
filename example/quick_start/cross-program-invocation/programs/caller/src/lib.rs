use anchor_lang::prelude::*;
use anchor_lang::solana_program::instruction::Instruction;
use anchor_lang::solana_program::program::invoke_signed;
use callee::Counter as CalleeState;

// Program "caller" wykonuje CPI do programu "callee".
#[program]
pub mod caller {
    use super::*;

    pub fn increment_via_cpi(ctx: Context<IncrementViaCpi>, amount: u64) -> Result<()> {
        let counter_key = ctx.accounts.counter.key();
        let authority_key = ctx.accounts.authority.key();
        let bump = ctx.accounts.counter.bump;

        let accounts = vec![
            AccountMeta::new(counter_key, false),
            AccountMeta::new_readonly(authority_key, true),
        ];

        let data = CalleeInstruction::Increment { amount }.data();
        let ix = Instruction {
            program_id: ctx.accounts.callee_program.key(),
            accounts,
            data,
        };

        let seeds: &[&[u8]] = &[b"counter", authority_key.as_ref(), &[bump]];

        invoke_signed(
            &ix,
            &[
                ctx.accounts.counter.to_account_info(),
                ctx.accounts.authority.to_account_info(),
            ],
            &[seeds],
        )?
        .into();

        Ok(())
    }
}

#[derive(Accounts)]
pub struct IncrementViaCpi<'info> {
    #[account(mut)]
    pub counter: Account<'info, CalleeState>,
    pub authority: Signer<'info>,
    /// CHECK: CPI wymaga dostarczenia programu "callee" jako AccountInfo.
    pub callee_program: AccountInfo<'info>,
}

// Minimalne odwzorowanie instrukcji programu callee.
use anchor_lang::solana_program::instruction::AccountMeta;

#[derive(anchor_lang::AnchorSerialize, anchor_lang::AnchorDeserialize)]
pub enum CalleeInstruction {
    Increment { amount: u64 },
}

impl CalleeInstruction {
    pub fn data(&self) -> Vec<u8> {
        let mut data = Vec::new();
        self.serialize(&mut data).expect("serialize");
        data
    }
}

pub use callee::accounts::Counter as CalleeCounter;
