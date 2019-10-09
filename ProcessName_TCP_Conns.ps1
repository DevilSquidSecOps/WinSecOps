# Make a lookup table by process ID
$Processes = @{}
Get-Process -IncludeUserName | ForEach-Object {
    $Processes[$_.Id] = $_
}

#Query the the netstat table for all processes with a particular name we are looking for
Get-NetTCPConnection | 
    Where-Object { $Processes[[int]$_.OwningProcess].ProcessName -like "OUTLOOK" } | # using the where-object clause select the process name to query for
    Select-Object localaddress,localport,remoteaddress,State, #add object params here
        RemotePort,
        @{Name="PID";         Expression={ $_.OwningProcess }},
        @{Name="ProcessName"; Expression={ $Processes[[int]$_.OwningProcess].ProcessName }}, 
        @{Name="UserName";    Expression={ $Processes[[int]$_.OwningProcess].UserName }} |
    Sort-Object -Property ProcessName, UserName | # sorting
    Format-Table -AutoSize # creating a table of the data
