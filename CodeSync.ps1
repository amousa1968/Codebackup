# This file created and MAINTAINER ayman.mousa <ayman.mousa@smtp.com>
#copyCode.ps1

#simple script to sync code to a list of servers


$serverlist = Get-Content(".\serverlist.txt")

foreach ($server in $serverlist)
    {
     write-host "Coping to $server"   
     $remotepath= "\\"+$server+"\c$\inetpub\wwwroot"
     $copyPath = "C:\inetpub\wwwroot\"
     Start-job -ScriptBlock{param ($copyPath,$remotepath) Copy-Item $copyPath $remotepath -Recurse -Force} -Argumentlist $copyPath,$remotepath
     
    }
$i=0
$runningjobs=@(get-job -state running).count 

while ($runningjobs -ne 0)
    {
    Start-Sleep -Seconds 2
    $runningjobs=@(get-job -state running).count    
    $i++
    $i++
    Write-Host "Code Sync has been running for $i seconds.  Please be patient"
    }
 
  

    Write-Host "Code Sync Complete" 