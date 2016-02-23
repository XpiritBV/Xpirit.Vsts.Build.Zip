Param(
    [string] $ItemSpec = ""
)

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Write-Output "ItemSpec: $ItemSpec" 

if (-not $ItemSpec -eq "") 
{ 
    [string[]] $Files = $ItemSpec -split ';|\r?\n' 
} 

Foreach ($Item in $Files) { 
	if ($Item){
		$Item = [System.IO.Path]::Combine($env:BUILD_SOURCESDIRECTORY, $Item)
		$OutputDir = [System.IO.Path]::Combine($env:BUILD_SOURCESDIRECTORY, $Item).ToLower() -replace ".zip","" 
		Write-Output "Item $Item to directory $OutputDir"
		Unzip $Item $OutputDir  
	}
}