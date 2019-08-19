Add-Type -AssemblyName System.IO.Compression.FileSystem

function Resolve-PathSafe
{
    param
    (
        [string] $Path
    )
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Path)
}

function Unzip
{
    param([string]$zipfile, [string]$outpath)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

$ItemSpec = Get-VstsInput -Name ItemSpec -Require
$destination = Get-VstsInput -Name destination

Write-Output "ItemSpec: $ItemSpec" 
Write-Output "Destination: $destination"

if (-not $ItemSpec -eq "") 
{ 
    [string[]] $Files = $ItemSpec -split ';|\r?\n' 
} 

Foreach ($Item in $Files) { 
	if ($Item){
		$Item = Resolve-PathSafe $Item
		if ($Item.ToLower().EndsWith(".zip")){
			if ($destination)
            {
    			$OutputDir =  Resolve-PathSafe $destination 
			} else {
    			$OutputDir =  $Item.ToLower() -replace ".zip","" 
			}
			Write-Output "Unzip $Item to directory $OutputDir"
			Unzip $Item $OutputDir  
		}else{
				Write-Output "Item $Item does not ends on .zip"
		}
	}
}
