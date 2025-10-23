# Windows installation helper inspired by the official quick install guide.

# Ensure running in PowerShell with admin privileges to allow winget installs.
if (-not ([bool](net session 2>$null))) {
  Write-Error "Run this script from an elevated PowerShell session."
  exit 1
}

# Install Solana CLI via winget as described in the guide.
winget install --id SolanaLabs.Solana -e

# Optionally remind the user that developer tools live under %LOCALAPPDATA%.
Write-Output "Solana CLI installed. Restart your terminal so PATH updates take effect."
