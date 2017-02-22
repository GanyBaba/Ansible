#Data Input from feed file and Variable defination
$servers = Get-Content .\projects\host.txt
$Logfile = ".\projects\log.txt"
$Errorlog = ".\Projects\errorlog.txt"
$date = date

#Setting up the logfile format
"Date&Time|Server|Operating Sytem|SerialNo|Version|Manufacturer" | Out-File -FilePath $Logfile

#describing the input sequence of the feed file
foreach ($Server in $servers) {

    Write-Host "Working on:$server"
#ping to check server is online and proceed to run wmi
if 
(Test-connection $server -Quiet -Count 2) {
#connecting to wmi to get BIOS info
    $bios = Get-WmiObject -class win32_bios
#displaying on screen the BIOS info for of the current server in the loop
    #write-host "$server | $bios"
#connecting to wmi to get the OS info

      $OS = Get-WmiObject -class win32_operatingsystem
      Write-Host $OS.caption

"$date|$Server|$($OS.Caption)|$($Bios.serialNumber)|$($Bios.Version)|$($Bios.Manufacturer)" | Out-File -Append -FilePath $Logfile
      }

Else {
"$D|Server:$server is not pinging" | Out-File -Append -FilePath $Errorlog
} 

}







