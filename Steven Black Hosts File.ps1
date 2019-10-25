## Gets the latest Steven Black Hosts file form the main repo.

###########################################################################################################################################################
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Invoke-WebRequest "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" -OutFile "C:\Windows\System32\drivers\etc\hosts"
ipconfig /flushdns
###########################################################################################################################################################