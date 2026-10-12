# Comprueba los preajustes: cada elemento del manifiesto tiene su archivo rodaje.exportpreset v1 con el mismo id, y no sobra ninguno.
$ErrorActionPreference = 'Stop'
$raiz = $PSScriptRoot
$manifiesto = [System.IO.File]::ReadAllText((Join-Path $raiz 'paquete.json')) | ConvertFrom-Json
$fallos = 0
$vistos = @{}
foreach ($e in $manifiesto.items) {
    if ($e.kind -ne 'export-preset') { Write-Host "  $($e.id): tipo $($e.kind)" -ForegroundColor Red; $fallos++; continue }
    if ($vistos.ContainsKey($e.id)) { Write-Host "  $($e.id): repetido" -ForegroundColor Red; $fallos++ }
    $vistos[$e.id] = $true
    $ruta = Join-Path $raiz $e.file
    if (-not (Test-Path -LiteralPath $ruta)) { Write-Host "  $($e.id): falta $($e.file)" -ForegroundColor Red; $fallos++; continue }
    $p = [System.IO.File]::ReadAllText($ruta) | ConvertFrom-Json
    if ($p.format -ne 'rodaje.exportpreset' -or $p.version -ne 1 -or $p.id -ne $e.id -or -not $p.name -or -not $p.container -or -not ($p.video -or $p.audio)) {
        Write-Host "  $($e.id): cabecera, id, nombre, contenedor o pistas" -ForegroundColor Red; $fallos++
    }
}
foreach ($f in Get-ChildItem -LiteralPath (Join-Path $raiz 'preajustes') -Filter *.json) {
    if (-not $vistos.ContainsKey($f.BaseName)) { Write-Host "  sobra $($f.Name)" -ForegroundColor Red; $fallos++ }
}
if ($fallos -gt 0) { Write-Host "  $fallos fallos" -ForegroundColor Red; exit 1 }
Write-Host "  $($manifiesto.items.Count) preajustes: todo bien." -ForegroundColor Green
exit 0
