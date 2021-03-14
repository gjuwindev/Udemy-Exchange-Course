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

# can users themselves register for an alias, without an administrator?

# Get-Mailbox pgklada | Select-Object PrimarySmtpAddress, Name, Id, DistinguishedName, SimpleDisplayName, RecipientType, EmailAddresses, DisplayName, Alias, AdministrativeUnits, AddressListMembership, UsageLocation, DefaultAuditSet, WindowsLiveID, MicrosoftOnlineServicesID, UserPrincipalName, IssueWarningQuota, RulesQuota, IsMailboxEnabled, Languages, ProhibitSendReceiveQuota, ProhibitSendQuota, RecoverableItemsQuota, RecoverableItemsWarningQuota, ForwardingSmtpAddress, ForwardingAddress, RetentionPolicy
