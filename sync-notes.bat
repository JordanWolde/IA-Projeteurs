@echo off
echo Synchronisation des notes "IA Projeteur" vers le site...
robocopy "C:\Users\jwoldehana\OneDrive - BRL\03_RESSOURCES\COFFRE_OBSIDIAN_JWO\01_PROJETS\IA Projeteur" "C:\Users\jwoldehana\quartz-ia-projeteurs\content" /MIR /XF index.md /NFL /NDL /NJH /NJS
if %errorlevel% geq 8 (
  echo ERREUR pendant la copie.
  pause
  exit /b 1
)

echo Ajout des notes complementaires hors dossier IA Projeteur, pour que leurs liens fonctionnent...
for /d %%D in ("C:\Users\jwoldehana\quartz-ia-projeteurs\content\Projet 1 - Assistance*") do (
  copy /Y "C:\Users\jwoldehana\OneDrive - BRL\03_RESSOURCES\COFFRE_OBSIDIAN_JWO\02_DOMAINES\HYDRA\TOPOS\HYDRA-TOPOS.md" "%%D\HYDRA-TOPOS.md" >nul
  copy /Y "C:\Users\jwoldehana\OneDrive - BRL\03_RESSOURCES\COFFRE_OBSIDIAN_JWO\02_DOMAINES\HYDRA\TOPOS\POC-IA5 - HYDRA-TOPOS.md" "%%D\POC-IA5 - HYDRA-TOPOS.md" >nul
)
for /d %%D in ("C:\Users\jwoldehana\quartz-ia-projeteurs\content\Projet 2 - Production de livrables ass*") do (
  copy /Y "C:\Users\jwoldehana\OneDrive - BRL\03_RESSOURCES\COFFRE_OBSIDIAN_JWO\02_DOMAINES\HYDRA\AKRIBIA\Presentation generale.md" "%%D\Presentation generale.md" >nul
)

echo.
echo Copie terminee. Ouvre GitHub Desktop pour valider et publier.
pause
