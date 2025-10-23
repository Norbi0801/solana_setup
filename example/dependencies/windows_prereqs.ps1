# Installs Windows prerequisites needed by the dependency guide.

# Ensure the script runs with admin rights.
if (-not ([bool](net session 2>$null))) {
  Write-Error "Run from an elevated PowerShell session."
  exit 1
}

# Install Visual Studio Build Tools for C++ workloads required by Anchor.
winget install --id Microsoft.VisualStudio.2022.BuildTools -e `
  --override "--add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --quiet --wait"

# Install LLVM to supply clang and lld toolchains.
winget install --id LLVM.LLVM -e

# Install Git if missing because many commands depend on it.
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  winget install --id Git.Git -e
}

Write-Output "Reboot Windows to finalise build tool installations."
