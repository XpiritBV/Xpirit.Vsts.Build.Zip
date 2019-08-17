Add-Type -Assembly System.IO.Compression.FileSystem

function Resolve-PathSafe
{
    param
    (
        [string] $Path
    )
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
}


function ZipFiles( $zipfilename, $sourcedir )
{
   $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
   [System.IO.Compression.ZipFile]::CreateFromDirectory($sourcedir, $zipfilename, $compressionLevel, $false)
}

$ItemSpec = Get-VstsInput -Name ItemSpec -Require


Write-Output "ItemSpec: $ItemSpec" 

if (-not $ItemSpec -eq "") 
{ 
    [string[]] $DirectoryFiles = $ItemSpec -split ';|\r?\n' 
} 

Foreach ($Item in $DirectoryFiles) 
{ 
	if ($Item){
		$Item = Resolve-PathSafe  $Item
    	$ZipFile = -join($Item,".zip")

		Write-Output "Directory $Item to zip $ZipFile"
	    ZipFiles  $ZipFile $Item
	} 
}

