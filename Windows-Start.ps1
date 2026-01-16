# Verificar si el script se está ejecutando con privilegios de administrador
if (-not [Security.Principal.WindowsIdentity]::GetCurrent().Groups -match "S-1-5-32-544") {
    Write-Host "Este script necesita permisos de administrador. Intentando reiniciar el script con permisos elevados..."
    Start-Process powershell -ArgumentList "-NoExit -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

# Verificar si Chocolatey ya está instalado
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Instalando Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Script para instalar varios programas usando Chocolatey
$programas = @(
    "winrar",
    "brave",
    "visualstudiocode",
    "nodejs-lts"
)

# Ejecutar cada instalación en una ventana nueva con privilegios de administrador
foreach ($programa in $programas) {
    Write-Host "Instalando $programa..."
    Start-Process powershell -Verb RunAs -ArgumentList "-NoExit -Command `"choco install $programa -y`""
}

Write-Host "¡Todas las instalaciones se han iniciado!"
