#collect domain controllers in a var
$dcs = Get-ADDomainController -Filter * | Select-Object -Property name 

#loop through each one calling them by the object "name" filter we used in the above var
foreach ($name in $dcs.name){
  Test-Connection -ComputerName $name -Count 1 -ErrorAction Ignore
  }

# https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-addomaincontroller?view=win10-ps
#use a backtick ` char to escape special chars
echo "`n primary DC is:"
Get-ADDomainController -Discover -Domain "contoso.com" -Service "PrimaryDC"
