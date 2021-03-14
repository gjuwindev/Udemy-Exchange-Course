# .\ConnectToExchangeOnline.ps1

#get-mailbox -ResultSize 3
#"3pro", "ivang" | get-mailbox

# Get-MsolAccountSku  # shows available licence packages

# Import-Csv -Path c:\users.csv | foreach {
#     New-MsolUser -DisplayName $_.DisplayName `
#                  -FirstName $_.FirstName `
#                  -LastName $_.LastName `
#                  -UserPrincipalName $_.UserPrincipalName `
#                  -UsageLocation $_.UsageLocation `
#                  -LicenceAssignment $_.AccountSkuId `
#                  -Password $_.Password}

# how to enable multifactor authentication from powershell

# how to add mail aliases and how to make them primary

