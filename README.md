# SIDSentinel 🛡️

SIDSentinel is a PowerShell auditing toolkit that detects **duplicate Security Identifiers (SIDs / dual SPIDs)**
across Windows user accounts prior to upgrading systems to **Windows 11**.

Duplicate SIDs can cause:
- Profile corruption
- Group Policy failures
- Permission conflicts
- Windows 11 upgrade failures

This project is designed for system administrators, DevOps engineers, and security teams.

---

## Features
- Local user SID discovery
- Domain user SID discovery
- Duplicate SID detection
- CSV export for reporting
- Read-only / safe execution

## Requirements
- Windows 10 / 11
- PowerShell 5.1+
- RSAT (for domain scans)

## Usage
```powershell
.\scripts\powershell\Get-LocalUserSIDs.ps1
.\scripts\powershell\Get-DomainUserSIDs.ps1
.\scripts\powershell\Detect-DuplicateSIDs.ps1
```

## Output
Reports are saved to the `output/` directory.

## License
MIT
