Import-Module ActiveDirectory

$output = @()

Get-ADUser -Filter * | ForEach-Object {
    $output += [PSCustomObject]@{
        Username    = $_.SamAccountName
        SID         = $_.SID.Value
        AccountType = "Domain"
    }
}

$output | Export-Csv ".\output\sid_inventory.csv" -NoTypeInformation -Append
