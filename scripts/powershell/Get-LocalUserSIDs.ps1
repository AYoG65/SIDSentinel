$output = @()

Get-LocalUser | ForEach-Object {
    $sid = (New-Object System.Security.Principal.NTAccount($_.Name)).Translate([System.Security.Principal.SecurityIdentifier]).Value
    $output += [PSCustomObject]@{
        Username    = $_.Name
        SID         = $sid
        AccountType = "Local"
    }
}

$output | Export-Csv ".\output\sid_inventory.csv" -NoTypeInformation -Append
