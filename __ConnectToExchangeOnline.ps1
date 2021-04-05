# this is ConnectToExchangeOnline.ps1

# $pwd = ""
# $pwdEncoded = [Convert]::ToBase64String([Text.Encoding]::Utf8.GetBytes($pwd))

$neDirajFileName = "C:\neDiraj.txt"
$lines = get-content $neDirajFileName
$lines2 = $lines[1] -split ":"

############################################################################

$LdapUser = "pgklada@ffzg.hr"
$LdapPwdEncoded = $lines2[0]
$LdapPwdEncoded2 = $LdapPwdEncoded.Substring(0, $LdapPwdEncoded.length-1)  # there is an excessive char at the end
$LdapPwd = [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String($LdapPwdEncoded2))
# $LdapPWordSecured = ConvertTo-SecureString -String $LdapPwd -AsPlainText -Force
# $LdapUserCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $LdapUser, $LdapPWordSecured

############################################################################

$O365User = "pgklada@m.ffzg.hr"
$O365pwdEncoded = $lines2[1]
$O365pwdEncoded2 = $O365pwdEncoded.Substring(0, $O365pwdEncoded.length-1) + "="  # there is an excessive char at the end
$O365pwd = [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String($O365pwdEncoded2))
$O365PWordSecured = ConvertTo-SecureString -String $O365pwd -AsPlainText -Force
$O365UserCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $O365User, $O365PWordSecured

############################################################################

Write-Output "`nConnecting to Microsoft Online..."
#Install-Module MsOnline
Connect-MsOlService -Credential $O365UserCredential
Write-Output "`nConnected."

############################################################################

Write-Output "`nConnecting to Exchange Online..."
$Session_Exchange = New-PSSession -ConfigurationName Microsoft.Exchange `
                         -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
                         -Credential $O365UserCredential `
                         -Authentication Basic `
                         -AllowRedirection

Write-Output "`nConnected. Importing `$Session_Exchange..."
Import-PSSession $Session_Exchange -DisableNameChecking

Write-Output "`n`$Session_Exchange Imported..."

# Get-Mailbox -ResultSize 10
# Get-Mailbox -identity pgklada@m.ffzg.hr

# Write-Output "`nDisconnecting..."
# Remove-PSSession $Session_Exchange
# Write-Output "`nDisconnected..."

############################################################################

Write-Output "`nConnecting to Security & Compliance Center..."
$Session_Compliance = New-PSSession -ConfigurationName Microsoft.Exchange `
                         -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ `
                         -Credential $O365UserCredential `
                         -Authentication Basic `
                         -AllowRedirection

Write-Output "`nImporting `$Session_Compliance..."
Import-PSSession $Session_Compliance -DisableNameChecking -Prefix CPL

Write-Output "`n`$Session_Compliance Imported..."


# Write-Output "`nDisconnecting..."
# Remove-PSSession $Session_Compliance
# Write-Output "`nDisconnected..."

############################################################################

# Write-Output "`nConnecting to AzureAD..."
# Connect-AzureAD -Credential $O365UserCredential

# Get-Mailbox pgklada@m.ffzg.hr | fl audit*
# Get-Mailbox -ResultSize unlimited | foreach { if ($_.AuditEnabled -eq $false) { $_ } }
# Set-Mailbox <email_address> -AuditOwner @{Add="mailboxlogin", "harddelete"}
# Get-Mailbox -ResultSize unlimited -Filter { recipienttypedetails -eq "usermailbox" } Set-Mailbox -AuditOwner @{add="mailboxlogin"}

# Set-HostedConnectionFilterPolicy "Default" -IPAllowList @{add="IP1", "IP2"...} -IPBlockList @{add="IP3", "IP4"...}
# Set-HostedConnectionFilterPolicy "Default" -IPAllowList @{add="IP1-IP2"...} -IPBlockList @{remove="IP3", "IP4"...}



