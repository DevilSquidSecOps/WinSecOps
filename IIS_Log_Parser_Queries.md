# Parsing IIS Logs

* Download Log Parser Studio to parse through IIS logs
* Use the % as wildcards
* find exchange OWA IIS logs at  C:\InetPub\Logs\LogFiles\W3SVC1 
* Install Main tool: https://www.microsoft.com/en-us/download/confirmation.aspx?id=24659
* install GUI addon: https://gallery.technet.microsoft.com/Log-Parser-Studio-cd458765
* When running it look for "LPS" in the windows search bar to pull it up

**Query for a string in the URL and exclude Internal IPs**

/* Query for a string in the URL and exclude Internal IPs */

select logrow, date, time, c-ip, cs-username, cs-method, cs-uri-stem, sc-status, cs-uri-query

FROM '[LOGFILEPATH]'

where cs-uri-stem like '%AppTest%' and c-ip not like '192.168.%' and c-ip not like '172.31.%' and c-ip not like '10.%'

order by date, time, logrow

**Get anything with File extensions**

/*  Get anything with File extensions */

select logrow, date, time, c-ip, cs-username, cs-method, cs-uri-stem, cs-uri-query

FROM '[LOGFILEPATH]'

where cs-uri-stem like '%.aspx' order by date, time, logrow
