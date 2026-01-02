$data = Import-Csv ".\output\sid_inventory.csv"

$duplicates = $data | Group-Object SID | Where-Object { $_.Count -gt 1 }

$report = foreach ($group in $duplicates) {
    foreach ($user in $group.Group) {
        [PSCustomObject]@{
            Username    = $user.Username
            SID         = $user.SID
            AccountType = $user.AccountType
            Duplicate   = "Yes"
        }
    }
}

$report | Export-Csv ".\output\duplicate_sid_report.csv" -NoTypeInformation
Write-Host "Duplicate SID report generated."
