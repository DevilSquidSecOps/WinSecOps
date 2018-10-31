$Path = "\\207.151.6.140\c$\Users\" #set location to path which can be a remote machine if you have access as the admin
$Find = "Patient" #what string to look for
$WordExts = '.docx','.doc','.docm' #Extensions used by Word documents

$Word = New-Object -ComObject Word.Application #Instantiates a Word object to read Word files
$Word.Visible = $false #hide the window

$ValidDocs = Get-ChildItem -Recurse $Path | ? {$_.Extension -in $WordExts} | ForEach { #Foreach doc/docx/docm file in the above folder And recursively search
    $Doc = $Word.Documents.Open($_.FullName) #Open the document in the word object
    $Content = $Doc.Content #get the 'content' object from the document
    $Content.MoveStart() | Out-Null #ensure we're searching from the beginning of the doc
                              #term,case sensitive,whole word,wildcard,soundslike,synonyms,direction,wrappingmode
    if ($Content.Find.Execute($Find,$false,        $true,     $false,  $false,    $false,  $true,    1)){ #execute a search
        Write-Host "$($_.Name) contains $($findText)" -ForegroundColor Green
        $_.FullName #store this in $ValidDocs
    } else {
        Write-Host "$($_.Name) does not contain $($findText)" -ForegroundColor Red
    }
    $Doc.Close() #close the individual document
    $Doc = $null #null it just in case
}

$Word.Quit() #quit the word process
$Word = $null #null it just in case

return $ValidDocs #return list of docs with the word in them
