# .\ConnectToExchangeOnline.ps1

#get-mailbox -ResultSize 3
#"3pro", "ivang" | get-mailbox

# Get-MsolAccountSku  # shows available licence packages

# $userLicence = "ffzghr:STANDARDWOFFPACK_IW_STUDENT"
# $userLicence = "ffzghr:STANDARDWOFFPACK_IW_FACULTY"

# Import-Csv -Path c:\users.csv | foreach {
    #     New-MsolUser -DisplayName $_.DisplayName `
    #                  -FirstName $_.FirstName `
    #                  -LastName $_.LastName `
    #                  -UserPrincipalName $_.UserPrincipalName `
    #                  -UsageLocation $_.UsageLocation `
    #                  -LicenceAssignment $_.AccountSkuId `
    #                  -Password $_.Password}
    
# how to enable multifactor authentication from powershell
# how to enable MFA via mobile phone, but disable mobile phone number display to everybody

# how to add mail aliases and how to make them primary

# can users themselves register for an alias, without an administrator?

# Get-Mailbox pgklada | Select-Object PrimarySmtpAddress, Name, Id, DistinguishedName, SimpleDisplayName, RecipientType, EmailAddresses, DisplayName, Alias, AdministrativeUnits, AddressListMembership, UsageLocation, DefaultAuditSet, WindowsLiveID, MicrosoftOnlineServicesID, UserPrincipalName, IssueWarningQuota, RulesQuota, IsMailboxEnabled, Languages, ProhibitSendReceiveQuota, ProhibitSendQuota, RecoverableItemsQuota, RecoverableItemsWarningQuota, ForwardingSmtpAddress, ForwardingAddress, RetentionPolicy

# Set-Mailbox pgklada@m.ffzg.hr -EmailAddresses @{Add='gjuro@m.ffzg.unizg.hr'}
# Set-Mailbox pgklada@m.ffzg.hr -EmailAddresses @{Remove='gjuro@m.ffzg.unizg.hr'}

# Set-MsolUserPrincipalName -UserPrincipalName  pgklada@m.ffzg.hr -NewUserPrincipalName pgklada2@m.ffzg.hr

# the first address becomes the primary address
# Set-Mailbox pgklada@m.ffzg.hr -EmailAddresses addresss1, address2 etc.

# Get-Mailbox -SoftDeletedMailbox

# Remove-MsolUser -UserPrincipalName pgklada@ffug.hr
# Get-MsolUser -ReturnDeletedUsers

# Get-MsolUser -ReturnDeletedUsers -UserPrincipalName pgklada@ffug.hr | Remove-MsolUser -RemoveFromRecycleBin -Force

# Get-Mailbox -SoftDeletedMailbox -Identity pgklada@ffug.hr | Remove-Mailbox -PermanentlyDelete

# Get-Mailbox -SoftDeletedMailbox -Identity double_deleted_userename@ffug.hr | Format-List UserPrincipalName,ObjectId

# Get-Mailbox -SoftDeletedMailbox -ObjectId <object-id> | Remove-Mailbox -PermanentlyDelete

# Get-Mailbox -Archive
# Enable-Mailbox pgklada@ffug.hr -Archive
# Disable-Mailbox pgklada@ffug.hr -Archive

# Get-Mailbox pgklada@ffug.hr | fl AutoExpandingArchiveEnabled
# Get-OrganizationConfig | fl AutoExpandingArchiveEnabled
# Set-OrganizationConfig | fl AutoExpandingArchiveEnabled
# Enable-Mailbox pgklada@ffug.hr -AutoExpandingArchiveEnabled

# $user.lastpasswordchangetimestamp.adddays(7) -ge $today

# New-DistributionGroup -Name <group_name> -Members <member_list>
# Remove-DistributionGroup infosluzba_test_DL2

# $members = Get-DistributionGroupMember infosluzba_test_DL | Select -ExpandProperty PrimarySmtpAddress
# New-DistributionGroup infosluzba_test_DL2 -Members $members

# Set-DistributionGroup ...

# Get-DistributionGroup [ <list_name> ]
# Get-DistributionGroupmember <list_name> | select name, primarysmtpaddress

# email-enabled security group
# New-DistributionGroup infosluzba_test_DL2 -Members $members -Type Security

# New-UnifiedGroup -DisplayName <group_name> -Members <member_list> -PrimarySmtpAddress <email_address>

# Get-DynamicDistributionGroup 
# New-DynamicDistributionGroup -Name HR -PrimarySmtpAddress <email> -Alias <name_alias> -Includerecipients mailusers,maxilboxusers -ConditionalDepartments "HR"
# Set-DynamicDistributionGroup <email> -ManagedBy <email_address>

# New-Mailbox -Shared -Name <mbox_name> -PrimarySmtpAddress <email>
# Add-MailboxPermission <shared_email_address> -AccessRights fullaccess -User <user_email>
# Remove-MailboxPermission <shared_email_address> -AccessRights fullaccess -User <user_email>  [ -Force? ]
# Add-MailboxPermission <shared_email_address> -AccessRights fullaccess -Automapping $false -User <user_email>
# Set-Mailbox <email> -Type shared
# Set-Mailbox <email> -Type regular
# Add-RecipientPermission <shared_email_address>  -AccessRights SendAs -Trustee <user_email> [ -Force? ]
# Remove-RecipientPermission <shared_email_address>  -AccessRights SendAs -Trustee <user_email> [ -Force? ]

# Set-DistributionGroup <mailbox_email> -GrantSendOnBehalf <user_email>
# Set-Mailbox <mailbox_email> -GrantSendOnBehalf <user_email>
# Set-DynamicDistributionGroup <mailbox_email> -GrantSendOnBehalf <user_email>
# Set-DynamicDistributionGroup <mailbox_email> -GrantSendOnBehalf @{remove="<user_name?>"}
# Get-DistributionGroup <mailbox_email> | fl name, GrantSendOnBehalf

