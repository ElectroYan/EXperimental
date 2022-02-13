$BasePath = "Y:\_Games\Rhythm Games\Osu\Skins\EXperimental"
$SubBase = $BasePath + "\Sounds"
$Files = Get-ChildItem -Path $BasePath | Select-Object Name

for ($i = 0; $i -lt $Files.Count; $i++) {
    $File = [string]$Files[$i].Name
    if ( $File.StartsWith("normal-") -or $File.StartsWith("soft-") -or $File.StartsWith("drum-")){
        $Path = $BasePath + "\" + $File
        Remove-Item -Path $Path
    }
}

#Get current type
$PathA = $SubBase + "\type.txt"
$Type = Get-Content -Path $PathA

#Get all types
$PathB = $SubBase + "\types.txt"
$Types = Get-Content -Path $PathB

$NewType

for ($i = 0; $i -lt $Types.Count; $i++) {
    if ($Types[$i] -eq $Type){
        $NewType = $Types[($i+1) % $Types.Count]
        break
    }
}

$NewType | Out-File -FilePath $PathA

$PathC = $SubBase + "\" + $NewType

$Files = Get-ChildItem -Path $PathC | Select-Object Name

for ($i = 0; $i -lt $Files.Count; $i++) {
    $File = $Files[$i].Name
    $PathS = $PathC + "\" + $File
    $PathD = $BasePath + "\" + $File
    Copy-Item -Path $PathS -Destination $PathD
}