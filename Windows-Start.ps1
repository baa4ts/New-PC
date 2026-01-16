# Paso 1: Descargar el script desde la URL y guardarlo en la carpeta TMP
$scriptUrl = "https://raw.githubusercontent.com/baa4ts/New-PC/refs/heads/main/Windows-Start.ps1"
$tmpFolder = [System.IO.Path]::Combine($env:TEMP, "Windows-Start.ps1")
Invoke-WebRequest -Uri $scriptUrl -OutFile $tmpFolder

# Paso 2: Comprobar si el script se está ejecutando con privilegios de administrador
if (-not [Security.Principal.WindowsIdentity]::GetCurrent().Groups -match "S-1-5-32-544") {
    Write-Host "Este script necesita permisos de administrador. Intentando reiniciar el script con permisos elevados..."
    Start-Process powershell -ArgumentList "-NoExit -File `"$tmpFolder`"" -Verb RunAs
    Exit
}

# Paso 3: Verificar si Chocolatey ya está instalado
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Instalando Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

    # Relanzar el script para que ejecute la instalación de los programas con Chocolatey
    Write-Host "Chocolatey instalado. Relanzando el script para continuar con la instalación de programas..."
    Start-Process powershell -ArgumentList "-NoExit -File `"$tmpFolder`"" -Verb RunAs
    Exit
}

# Paso 4: Lista de programas a instalar usando Chocolatey
$programas = @(
    "winrar",
    "brave",
    "visualstudiocode",
    "nodejs-lts",
    "git"
)

# Paso 5: Instalar los programas especificados con Chocolatey
Write-Host "Instalando programas..."

foreach ($programa in $programas) {
    Write-Host "Instalando $programa..."
    choco install $programa -y
}

Write-Host "¡Todas las instalaciones se han completado!"
