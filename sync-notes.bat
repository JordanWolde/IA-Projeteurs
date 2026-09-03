@echo off
echo Synchronisation des notes "IA Projeteur" vers le site...
robocopy "C:\Users\jwoldehana\OneDrive - BRL\03_RESSOURCES\COFFRE_OBSIDIAN_JWO\01_PROJETS\IA Projeteur" "C:\Users\jwoldehana\quartz-ia-projeteurs\content" /MIR /XF index.md /NFL /NDL /NJH /NJS
if %errorlevel% geq 8 (
  echo ERREUR pendant la copie.
  pause
  exit /b 1
)
echo.
echo Copie terminee. Ouvre GitHub Desktop pour valider et publier.
pause
