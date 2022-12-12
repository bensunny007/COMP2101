function hardware
{
"   **Hardware Description**   "
Get-WmiObject win32_computersystem | Format-List
"===================================================="
}
hardware
write-host "`n"
write-host "`n"


function OS {
"   **Operating System**   "
Get-WmiObject win32_operatingsystem|Select-Object name, version|Format-list
"===================================================="
}
OS
write-host "`n"
write-host "`n"



function processor {
"   **Processor Description**"
if ( (Get-WmiObject Win32_processor).Description -ne $null) { Write-Host -NoNewline "Description :" (Get-WmiObject Win32_processor).Description; echo "`n" }
if ( (Get-WmiObject Win32_processor).Name -ne $null) { Write-Host -NoNewline "Name :" (Get-WmiObject Win32_processor).Name; echo "`n" }
if ( (Get-WmiObject Win32_processor).NumberOfCores -ne $null) { Write-Host -NoNewline "NumberOfCores :" (Get-WmiObject Win32_processor).NumberOfCores; echo "`n" }
if ( (Get-WmiObject Win32_processor).NumberOfEnabledCore -ne $null) { Write-Host -NoNewline "NumberOfEnabledCore :" (Get-WmiObject Win32_processor).NumberOfEnabledCore; echo "`n" }

if ( (Get-WmiObject Win32_processor).NumberOfLogicalProcessors -ne $null) { Write-Host -NoNewline "NumberOfLogicalProcessors :" (Get-WmiObject Win32_processor).NumberOfLogicalProcessors; echo "`n" }
if ( (Get-WmiObject Win32_processor).L1CacheSize -ne $null) { Write-Host -NoNewline "L1CacheSize :" (Get-WmiObject Win32_processor).L3CacheSize; echo "`n"}
if ( (Get-WmiObject Win32_processor).L2CacheSize -ne $null) { Write-Host -NoNewline "L2CacheSize :" (Get-WmiObject Win32_processor).L3CacheSize; echo "`n"}

if ( (Get-WmiObject Win32_processor).L3CacheSize -ne $null) { Write-Host -NoNewline "L3CacheSize :" (Get-WmiObject Win32_processor).L3CacheSize }
"====================================================" 
}
processor
write-host "`n"
write-host "`n"



function ram {
"RAM summary"

$ramc=0
$Sysram = Get-WmiObject win32_physicalmemory 
foreach ($ram in $Sysram) {
                     new-object -typename psobject -property @{Venetworkor=$ram.Manufacturer
                                                               Description=$ram.Description
                                                               "Size(GB)"=$ram.Capacity / 1gb -as [int]
                                                               BankLabel= $ram.banklabel
                                                               Slot = $ram.Devicelocator
                                                               }
                                                               $ramc = $ram.capacity/1gb -as [int]
                                                               }
                                                               "
Total RAM (GB) = $($ramc)"
"===================================================="

}
ram
write-host "`n"
write-host "`n"




function diskdrive {
"  **Physical Drive Summary**"
Get-WmiObject -Class Win32_LogicalDisk |
    Where-Object {$_.DriveType -ne 5} |
    Sort-Object -Property Name |
    Select-Object Name, VolumeName, VolumeSerialNumber, FileSystem, Description, `
        @{"Label"="DiskSize(GB)";"Expression"={"{0:N}" -f ($_.Size/1GB) -as [float]}}, `
        @{"Label"="FreeSpace(GB)";"Expression"={"{0:N}" -f ($_.FreeSpace/1GB) -as [float]}}, `
        @{"Label"="%Free";"Expression"={"{0:N}" -f ($.FreeSpace/$.Size*100) -as [float]}} |
    Format-Table -AutoSize
"===================================================="}
diskdrive
write-host "`n"
write-host "`n" 


 

function networkconfig {
"    **Network Adapter Summary**"
get-ciminstance win32_networkadapterconfiguration | where-object {$_.ipenabled -eq $true} | format-table Description, Index, IPAddress, IPSubnet, DNSDomain, DNSServerSearchOrder
"===================================================="}
networkconfig
write-host "`n"
write-host "`n"



function videocard {
"   **Video Card Summary**"

Get-WmiObject win32_videocontroller | Select-Object name, description, videomodedescription | Format-list
"====================================================" }
videocard
write-host "`n"
write-host "`n"
"            *END* " 