##Backupcode.ps1  
#MAINTAINER ayman.mousa <ayman.mousa@smtp.com>
#simple script to backup code on .net servers

$today= get-date -Format "MMddyyyy"


$backup_path= "C:\backup\$today"

$path=Test-Path $backup_path -PathType Container
if (!$path)
{

    New-Item $backup_path -type directory
}
else
{
    $i=0
    while ($path)
    {
    $backup_path_new=$backup_path+"_"+$i
    Write-Host $backup_path_new
    $path=Test-Path $backup_path_new -PathType Container

    if (!$path)
        {
        New-Item $backup_path_new -type directory
        }
    else
        {
        $i++
        }


    }
$backup_path=$backup_path_new
}



Copy-Item C:\inetpub\wwwroot\ $backup_path -Recurse

