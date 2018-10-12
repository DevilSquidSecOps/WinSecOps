# WinSecOps
Windows Security related management scripts, scenarios and commands
## Seaching for Files/Folder directories
dir <Folder Name> /AD /s ------------in CMD starting at the root of a drive locate a directory
##### Exchange/OWA connection logs
%SystemDrive%\inetpub\logs\LogFiles -------------- find date correlating with your siem alerts 
  
### Remote Control
##### Start a Remote session
Enter-PSSession -ComputerName COMPUTER -Credential USER
