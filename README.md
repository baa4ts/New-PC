# Script Windows 10 LTSC N

## ¿Qué hace?
Instala programas automáticamente en Windows 10 LTSC N.

## Programas que instala
- WinRAR
- Brave Browser
- Visual Studio Code
- Node.js
- Git

## Cómo usarlo

### Opción 1 (PowerShell):
```powershell
irm "https://raw.githubusercontent.com/baa4ts/New-PC/refs/heads/main/Windows-Start.ps1" | iex
```

### Opción 2 (Win+R):
1. Presiona `Win + R`
2. Pega esto:
```
powershell.exe -c "irm "https://raw.githubusercontent.com/baa4ts/New-PC/refs/heads/main/Windows-Start.ps1" | iex"
```

## ¿Qué pasa cuando lo ejecutas?
1. Te pide permisos de administrador
2. Instala Chocolatey (si no lo tienes)
3. Instala todos los programas de la lista
4. Muestra mensaje cuando termina

**Nota:** Necesitas internet.
