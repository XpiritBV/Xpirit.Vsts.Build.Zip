Param(
    [string] $ItemSpec = "$/"
)

function ZipFiles( $zipfilename, $sourcedir )
{
   Add-Type -Assembly System.IO.Compression.FileSystem
   $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
   [System.IO.Compression.ZipFile]::CreateFromDirectory($sourcedir,
        $zipfilename, $compressionLevel, $false)
}

Write-Output "ItemSpec: $ItemSpec" 

if (-not $ItemSpec -eq "") 
{ 
    [string[]] $DirectoryFiles = $ItemSpec -split ';|\r?\n' 
} 

Foreach ($Item in $DirectoryFiles) 
{ 
    $Item = [System.IO.Path]::Combine($env:BUILD_SOURCESDIRECTORY, $Item)
	Write-Output "Item $Item to zip"
	ZipFiles (-join($Item,".zip")) (-join($Item))
} 

