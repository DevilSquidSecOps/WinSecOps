# WinSecOps
Windows Security related management scripts, scenarios and commands
## Seaching for Files/Folders/Drives
dir <Folder Name> /AD /s ------------starting at the root of a drive locate a directory. CMD.
gdr -PSProvider 'FileSystem' --------------list all connected drives. Powershell.
######### ls -r -ea silentlycontinue -fo -inc "filename*.txt" | % { $_.fullname } -----------------find a file on a drive(start at root ie; C:\ ; wildcards allowed
## Known Log File locations
%SystemDrive%\inetpub\logs\LogFiles --------------Exchange/OWA connection logs
### Remote Control
Enter-PSSession -ComputerName COMPUTER -Credential USER -----------Start a Remote session
