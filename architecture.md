# SIDSentinel Architecture

## Overview
SIDSentinel collects Security Identifiers (SIDs) from Windows local and domain accounts,
normalizes the data, and detects duplicate values that may indicate cloned systems or
identity corruption risks.

## Workflow
1. Enumerate user accounts
2. Extract SID values
3. Aggregate inventory
4. Detect duplicates
5. Export report

## Security
- Read-only execution
- No account modification
- No credential handling

## Future Enhancements
- Remote host scanning
- Intune / SCCM integration
- GUI dashboard
