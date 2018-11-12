# WinSecOps
Windows Security related management scripts, scenarios and commands with CMD prompt and Powershell


## List connected drives/networked drives. 
CMD.
##### diskpart > list volume
##### net use
##### wmic logicaldisk get deviceid, volumename, description

Powershell.
##### gdr -PSProvider 'FileSystem' 

## Search for Files/Folders
CMD
##### dir "Folder Name" /AD /s
Find and locate multiple files with wildcards
##### dir /s *sysprep.inf *sysprep.xml *unattended.xml *unattend.xml *unattend.txt ExtraHop*.docx 2>nul

Powershell
##### ls -r -ea silentlycontinue -fo -inc "filename*.txt" | % { $_.fullname }
Search a drive specified and filter for a file. Wildcards allowed. Powershell
##### Get-ChildItem -Path D:\ -Filter 'gloria.donaldson*' -Recurse -ErrorAction SilentlyContinue -Force
Search for a string in various file types. Powerhsell
##### Get-ChildItem C:\* -include *.xml,*.ini,*.txt,*.config -Recurse -ErrorAction SilentlyContinue | Select-String -Pattern "password"
Search for a string in MS Word Documents. Powershell
##### See (find_string_word.ps1 script) and run in ISE to change the $find string as needed


## Known Log File locations
Exchange/OWA connection logs
##### %SystemDrive%\inetpub\logs\LogFiles\
##### example log: u_ex181011.log

## Remote Control
Start a Remote session. Powershell.
##### Enter-PSSession -ComputerName COMPUTER -Credential USER 
## Query AD for User information
Get users last password set date
###### Get-ADUser -Identity "user01" -Properties PasswordLastSet | Select-Object -Property Name, PasswordLastSet, Enabled
