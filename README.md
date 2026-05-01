# SIDSentinel 

A PowerShell auditing toolkit for detecting duplicate Security Identifiers (SIDs) across Windows user accounts — built for sysadmins and security teams managing enterprise Windows environments.

---

## The Problem

Duplicate SIDs occur when Windows systems are cloned, imaged, or migrated without proper SID regeneration. In enterprise environments, this causes:

- **Profile corruption** — users log into the wrong profile or lose settings
- **Group Policy failures** — GPOs apply to the wrong accounts
- **Permission conflicts** — access control breaks down silently
- **Windows 11 upgrade failures** — Microsoft's upgrade process rejects systems with SID conflicts
- **Audit and compliance gaps** — SID mismatches create orphaned accounts that evade detection

This is a real-world problem that hits during device refresh cycles, OS migrations, and M365/Entra ID joinings — exactly the kind of environment-scale issue that surfaces in NOC and enterprise sysadmin roles.

---

## What SIDSentinel Does

- Scans **local user accounts** for their SIDs
- Scans **domain user accounts** via RSAT (optional)
- Detects **duplicate SIDs** across accounts
- Exports results to **CSV** for reporting and audit trails
- Runs **read-only** — no changes are made to the system

---

## Requirements

- Windows 10 / 11 or Windows Server 2019 / 2022
- PowerShell 5.1 or later
- RSAT Tools (for domain scanning only — `Get-DomainUserSIDs.ps1`)
- Local administrator rights

---

## Usage

### Scan local users for SIDs
```powershell
.\scripts\powershell\Get-LocalUserSIDs.ps1
```

### Scan domain users for SIDs (requires RSAT)
```powershell
.\scripts\powershell\Get-DomainUserSIDs.ps1
```

### Detect duplicates across all discovered SIDs
```powershell
.\scripts\powershell\Detect-DuplicateSIDs.ps1
```

---

## Sample Output

```
[SIDSentinel] Scanning local accounts...

Username        SID                                            Status
--------        ---                                            ------
Administrator   S-1-5-21-1234567890-123456789-1234567890-500   OK
jsmith          S-1-5-21-1234567890-123456789-1234567890-1001  OK
jsmith_old      S-1-5-21-1234567890-123456789-1234567890-1001  *** DUPLICATE DETECTED ***
devopsadmin     S-1-5-21-1234567890-123456789-1234567890-1002  OK

[SIDSentinel] Scan complete. 1 duplicate SID found.
[SIDSentinel] Report saved to: output/sid_report_2026-04-30.csv
```

---

## Output Files

Reports are saved to the `output/` directory as timestamped CSV files:

```
output/
└── sid_report_2026-04-30.csv
```

Each report includes: username, SID, account status, and duplicate flag.

---

## Repository Structure

```
SIDSentinel/
├── scripts/
│   └── powershell/
│       ├── Get-LocalUserSIDs.ps1       # Local account SID enumeration
│       ├── Get-DomainUserSIDs.ps1      # Domain account SID enumeration
│       └── Detect-DuplicateSIDs.ps1   # Duplicate SID detection logic
├── docs/                               # Supporting documentation
├── architecture.md                     # Design and approach notes
└── README.md
```

---

## Use Cases

| Scenario | How SIDSentinel Helps |
|---|---|
| Pre-Windows 11 migration | Identify SID conflicts before upgrade failures occur |
| Device refresh / reimaging | Validate user accounts after mass deployment |
| Active Directory audit | Surface orphaned or duplicate accounts |
| Compliance review | Generate audit-ready CSV reports |
| Endpoint onboarding | Confirm clean SID state before Intune / Entra ID join |

---

## Why This Exists

During large-scale endpoint deployments — the kind that happen during device refresh cycles at 1,000+ user organizations — SID conflicts are a silent failure mode. They don't always throw visible errors immediately. They surface later as intermittent permission issues, broken GPOs, or failed logins. SIDSentinel was built to catch them proactively, before they become a helpdesk queue.

---

## Topics

`powershell` `active-directory` `windows` `security` `identity` `sid` `auditing` `sysadmin` `enterprise` `endpoint-management`
