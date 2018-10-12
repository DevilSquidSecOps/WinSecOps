# WinSecOps
Windows Security related management scripts, scenarios and commands
## Seaching for Files/Folders/Drives
starting at the root of a drive locate a directory. CMD.
##### dir <Folder Name> /AD /s
list all connected drives. Powershell.
##### gdr -PSProvider 'FileSystem' 
find a file on a drive(start at root ie; C:\ ; wildcards allowed. Finds Files or Directories. Powershell
##### ls -r -ea silentlycontinue -fo -inc "filename*.txt" | % { $_.fullname }

## Known Log File locations
Exchange/OWA connection logs
##### %SystemDrive%\inetpub\logs\LogFiles 
## Remote Control
Start a Remote session. Powershell.
##### Enter-PSSession -ComputerName COMPUTER -Credential USER 
