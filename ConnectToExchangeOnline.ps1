$neDirajFileName = "C:\neDiraj.txt"
$lines = get-content $neDirajFileName

$pwdEncoded = $lines[1]
$pwdEncoded = $pwdEncoded.Substring(0, $pwdEncoded.length-1) + "="  # there is an excessive char at the end
$pwd2 = [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String($pwdEncoded))

$User = "pgklada@m.ffzg.hr"
$PWord = ConvertTo-SecureString -String $pwd2 -AsPlainText -Force

$UserCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

Write-Output "`nConnecting to Microsoft Online..."
#Install-Module MsOnline
Connect-MsOlService -Credential $UserCredential
Write-Output "`nConnected."

Write-Output "`nConnecting to Exchange Online..."
$ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange `
                         -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
                         -Credential $UserCredential `
                         -Authentication Basic `
                         -AllowRedirection

Write-Output "`nConnected. Importing `$ExchSession..."
Import-PSSession $ExchangeSession -DisableNameChecking

Write-Output "`n`$ExchangeSession Imported..."

# Get-Mailbox -ResultSize 10
# Get-Mailbox -identity pgklada@m.ffzg.hr

# Write-Output "`nDisconnecting..."
# Remove-PSSession $ExchangeSession
# Write-Output "`nDisconnected..."

Write-Output "`nConnecting to Security & Compliance Center..."
$ComplianceSession = New-PSSession -ConfigurationName Microsoft.Exchange `
                         -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ `
                         -Credential $UserCredential `
                         -Authentication Basic `
                         -AllowRedirection

Write-Output "`nImporting `$ComplianceSession..."
Import-PSSession $ComplianceSession -DisableNameChecking -Prefix CPL

Write-Output "`n`$ComplianceSession Imported..."


# Write-Output "`nDisconnecting..."
# Remove-PSSession $ComplianceSession
# Write-Output "`nDisconnected..."