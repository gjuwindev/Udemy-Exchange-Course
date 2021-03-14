# .\ConnectToExchangeOnline.ps1

#get-mailbox -ResultSize 3
#"3pro", "ivang" | get-mailbox

# Get-MsolAccountSku  # shows available licence packages

New-MsolUser -UserPrincipalName gju_demo_user@m.ffzg.hr `
             -FirstName Caleb `
             -LastName Sills `
             -DisplayName "Caleb Sills" `
             -UsageLocation HR `
             -LicenseAssignment "ffzghr:STANDARDWOFFPACK_IW_STUDENT"
# can add    -Password <password>


             Get-MsolAccountSku