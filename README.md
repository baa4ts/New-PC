# Guía de Instalación Automática de Programas en Windows

Este script de PowerShell automatiza la instalación de varios programas en Windows utilizando **Chocolatey**. Los programas instalados incluyen **WinRAR**, **Brave**, **Visual Studio Code**, **Node.js LTS** y **Git**.

El script realiza las siguientes acciones:

1. **Descarga y guarda el script en la carpeta TMP**.
2. **Verifica si el script se está ejecutando con privilegios de administrador**.
3. **Instala Chocolatey** si no está presente en el sistema.
4. **Relanza el script** si es necesario para completar la instalación de Chocolatey.
5. **Instala los programas especificados** en la lista.
6. **Limpia la consola** después de cada instalación para mantener la salida ordenada.

## Requisitos

- **PowerShell** (generalmente preinstalado en Windows).
- **Chocolatey** (el script lo instalará automáticamente si no está presente).
- **Permisos de administrador** para instalar programas.

## Instrucciones

### 1. Descargar el script

El script se descarga automáticamente desde [GitHub](https://raw.githubusercontent.com/baa4ts/New-PC/refs/heads/main/Windows-Start.ps1) y se guarda en la carpeta temporal (`%TEMP%`) de tu máquina.

### 2. Ejecutar el script

1. **Abrir PowerShell como Administrador**:
   - Haz clic derecho en el icono de PowerShell y selecciona "Ejecutar como administrador".

2. **Ejecutar el script**:
   - Si has descargado el archivo `.ps1` o si has creado el script en tu máquina, navega hasta la carpeta donde se encuentra y ejecuta el script:
     ```powershell
     .\Windows-Start.ps1
     ```
   - Si no tienes privilegios de administrador, el script lo solicitará automáticamente y se reiniciará con privilegios elevados.

### 3. Funcionalidad del script

- **Comprobación de privilegios**: El script verifica si se está ejecutando como administrador. Si no es así, se relanzará con permisos elevados.
- **Instalación de Chocolatey**: Si **Chocolatey** no está instalado, el script procederá a instalarlo automáticamente.
- **Instalación de programas**: Una vez que **Chocolatey** está instalado, el script instala los siguientes programas:
  - **WinRAR**: `winrar`
  - **Brave**: `brave`
  - **Visual Studio Code**: `visualstudiocode`
  - **Node.js LTS**: `nodejs-lts`
  - **Git**: `git`
  
  La consola se limpiará después de cada instalación para mantenerla ordenada.

### 4. Personalización

Puedes editar el array `$programas` en el script para agregar o eliminar programas según tus necesidades.

```powershell
$programas = @(
    "winrar",
    "brave",
    "visualstudiocode",
    "nodejs-lts",
    "git"
)
