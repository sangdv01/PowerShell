# Script's short description here
# Created by Sang Dao
# Author: Sang Dao
# Edited on: 
# version: 1.0
# Description:
#    This script is used to install multiple KBs (msu file) in case SCCM/WSUS/Altiris #cannot pull out the KBs to servers.


$kbs = get-content ".\kb_list.txt"
$root = Get-Item ".\"
$args = "/quiet /norestart"
foreach ($kb in $kbs){
Write-host ""
Write-host "Installing $kb"  -BackgroundColor Red
$full = $root.FullName + "\" + $kb.ToString() + " " + $args
Write-Host ""
$SB = { start-process -filepath 'wusa.exe' -ArgumentList "$full" -Wait -PassThru }
Invoke-Command -ScriptBlock $SB
Write-Host ""
Write-host "Finished to install $kb" -ForegroundColor Green
}
