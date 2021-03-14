# .\ConnectToExchangeOnline.ps1

get-mailbox -ResultSize 3 | ForEach-Object {
  "=============================================== " + $_.UserPrincipalName
  $props = $_ | get-member
  foreach ($x in $props) {
    $line = $x.Name + ": " + $_.$($x.Name)
    $line
  }
  ""
}