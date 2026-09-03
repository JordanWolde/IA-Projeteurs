---
id: 20260808-1720
title: HYDRA-TOPOS
type: projet
domain: bim
status: stable
created: 2026-08-08
updated: 2026-09-01
tags:
  - fastapi
  - maplibre
  - lidar
  - dxf
  - ign
  - cloudflare
summary: Outil web interne type TopoExport souverain, sélection d'une emprise sur carte et export de données géographiques françaises (IGN) vers des formats CAO/BIM/SIG (DXF, LandXML, GeoTIFF, semis de points). Phases 0 à 2 livrées et validées en réel, phase 3 (extension mondiale) largement engagée, phase 4 (durcissement) non commencée.
revu: true
stack:
  - python
  - fastapi
  - react
  - maplibre-gl
  - docker
repo:
next: Découper l'upload LiDAR par morceaux côté navigateur, le tunnel Cloudflare plafonne chaque requête à environ 100 Mo, devenu bloquant en usage réel depuis l'ouverture de l'accès distant.
---

## Vue d'ensemble

HYDRA-TOPOS est un outil web de type "TopoExport souverain" pour un bureau d'études. L'objectif : sélectionner une emprise sur une carte et exporter des données géographiques françaises (IGN, gratuites, Licence Ouverte) vers des formats métier CAO/BIM/SIG. Une extension mondiale est prévue et déjà largement engagée en phase 3.

Développeur : Jordan, projeteur BIM (Revit, AutoCAD, Covadis, Civil 3D, QGIS), débutant en code, pilote tout via Claude Code. Approche de travail : petites étapes vérifiables, une fonctionnalité = un module = des tests = validation manuelle avant de passer à la suite, jamais de big bang.

Souveraineté des données : sources publiques françaises, auto hébergement (TrueNAS perso d'abord, VPS français ensuite).

Différenciateurs recherchés par rapport à TopoExport : choix du système de coordonnées, exports réellement géoréférencés ou en origine locale documentée, LandXML, points sol LiDAR bruts, nommage de calques conforme à la charte interne.

## Architecture (monorepo)

- `engine/` : librairie Python + CLI. Tout le géospatial. Zéro dépendance web. Doit fonctionner seul en CLI, c'est le principe cardinal du projet.
- `api/` : FastAPI + jobs asynchrones (RQ + Redis). Mince : validation, orchestration, assemblage ZIP, endpoints de progression.
- `web/` : Vite + React + MapLibre GL JS + Terra Draw + Tailwind. Le navigateur client ne stocke rien, il télécharge le ZIP final.
- `deploy/` : docker compose (dev = prod), pensé pour TrueNAS.

## Stack technique

- Python 3.11+, uv, ruff, pytest, type hints.
- Image Docker de base : ghcr.io/osgeo/gdal:ubuntu-full.
- Géo : rasterio, pyogrio, shapely, pyproj, ezdxf, trimesh, contourpy (courbes de niveau, remplace osgeo.gdal.ContourGenerate indisponible hors Docker).
- Phase 2+ : PDAL ou laspy (LiDAR), lxml (LandXML). Phase 3 : ifcopenshell, duckdb + extension spatiale (Overture).
- Extras optionnels : `api`, `dev`, `monde` (duckdb), `lidar` (laspy[lazrs], pye57, scipy), `profil` (matplotlib, PDF de profil). Chaque capacité est exposée par `/api/sante` et le front désactive proprement ce qui manque.
- Front : MapLibre GL JS (pas Mapbox, pas de clé), Terra Draw pour l'emprise, deck.gl (core, layers, mapbox, mesh layers) pour la 3D.

## Sources de données France

Services Géoplateforme IGN, ouverts, sans clé, rate limité par IP (backoff + limite volontaire d'environ 5 req/s par service, sauf WMTS/TMS).

- Vecteurs (WFS) : data.geopf.fr/wfs/ows, GetFeature v2.0.0, SRSNAME EPSG:2154, sortie JSON, pagination. Couches figées dans `engine/config/sources.py` : BDTOPO_V3 (bâtiment, tronçon de route, tronçon de voie ferrée, surface hydrographique, tronçon hydrographique, zone de végétation), parcelle cadastrale.
- Orthophoto (WMS raster) : data.geopf.fr/wms-r, GeoTIFF, EPSG:2154, tuiles de 2048 px max, mosaïque GDAL. BD ORTHO 20 cm par défaut, HR 5 à 10 cm et PCRS là où disponibles.
- MNT : source primaire MNT LiDAR HD 50 cm (dalles 1 km, Lambert 93 / NGF IGN69), découverte par bbox via la couche d'assemblage IGNF_MNT-LIDAR-HD:dalle, cache local, fallback RGE ALTI 1 m si dalle absente (ce fallback reste à coder).
- Géocodage : data.geopf.fr/geocodage (BAN).
- Fond de plan front : WMTS data.geopf.fr/wmts.
- Interdit : l'API de calcul altimétrique pour générer des semis de points (limitée à 5 req/s), toujours échantillonner le raster MNT local.

## Produits d'export

MVP (phase 1) : orthophoto GeoTIFF géoréférencée, MNT GeoTIFF géoréférencé, courbes de niveau DXF (maîtresses et intercalaires sur calques séparés, cotes TEXT en option), semis de points (TXT Matricule X Y Z Covadis + DXF POINT), DXF 2D vecteurs de base.

Phase 2 : bâtiments 3D LOD1 (extrusion attribut hauteur BD TOPO, base calée sur le MNT), maillage terrain (grille ou TIN Delaunay), LandXML (surface TIN native Covadis/Civil 3D), semis depuis les vrais points sol LiDAR HD, export LAZ/COPC.

Phase 3 : monde entier (Overture Maps en GeoParquet via DuckDB, OSM en complément, MNT Copernicus GLO-30, géocodage Photon/Nominatim), formats OBJ/glTF/STL, terrain texturé pour Lumion, IFC, PDF/SVG. Bathymétrie littorale (Litto3D/SHOM) à étudier.

Hors périmètre assumé : couches Géorisques/PPRI, authentification complexe, multi tenant, facturation, orthophoto haute résolution mondiale (aucune source libre).

## Règles métier non négociables

- CRS au choix à l'export : Lambert 93 (2154), CC42 à CC50 (3942 à 3950, suggestion auto selon la latitude), UTM auto, WGS84 pour GeoJSON.
- DXF en version R2013 (AC1027), unités mètres. Deux modes : coordonnées réelles ou origine locale (offset arrondi à la centaine de mètres). L'offset et l'EPSG figurent toujours dans le sidecar.
- Sidecar `metadata.json` dans chaque ZIP : EPSG, mode origine et offsets, bbox, date d'export, sources et millésimes, référence verticale (NGF IGN69), mention de licence IGN.
- Calques DXF configurables dans `engine/config/layers.json` pour coller à la charte interne HYDRA.
- Garde fous : surface max par produit, estimation taille/durée systématique avant lancement du job.

## Roadmap et critères de validation

- Phase 0 (POC CLI) : export via ligne de commande, DoD ouverture et superposition correcte dans QGIS et AutoCAD/Covadis. Livrée et validée.
- Phase 1 (MVP web) : carte, recherche d'adresse, dessin d'emprise, formulaire produits/CRS, job asynchrone, ZIP. DoD : un collègue non SIG réalise un export seul. Livrée côté technique, validation collègue encore à faire.
- Phase 2 (vecteurs 2D/3D, maillage, LandXML, LiDAR) : DoD LandXML importé comme surface native dans Covadis et Civil 3D, bâtiments 3D calés au bon Z. Livrée techniquement, validation métier CAO encore à faire.
- Phase 3 (monde et formats avancés) : lots 1 (terrain Copernicus), 2 (vecteurs/bâtiments Overture) et 3a (fond de plan monde OpenFreeMap) livrés et validés en réel. Restent les lots 3b (géocodage Photon en secours hors France) et 3c (E2E playwright monde).
- Phase 4 (durcissement) : quotas, auth, monitoring, éventuel miroir élargi, migration hébergement. Non commencée.

## État d'avancement (au 8 août 2026, environ 130 tests)

Livré et validé en réel :

- Engine complet, produits phase 0 validés par export réel près de Nîmes (ortho, MNT, semis TXT/DXF, vecteurs DXF 2D), superposition au pixel, sidecar complet.
- Noms de couches IGN vérifiés via GetCapabilities et figés dans `engine/config/sources.py`, jamais devinés.
- Garde fous d'estimation taille/durée avant job, callback de progression dans le pipeline.
- API phase 1 (FastAPI + RQ/Redis) validée en réel : santé, estimations, exports, progression, téléchargement.
- Front phase 1 (look TopoExport) validé en réel : carte MapLibre, emprise Terra Draw déplaçable/redimensionnable, recherche BAN, panneau produits complet, export réel testé en E2E playwright.
- Courbes de niveau réécrites avec contourpy (fin de la dépendance Docker/osgeo), validées en réel.
- Import de contour de zone (DXF, SHP zippé, KML/KMZ) et découpe exacte de l'export au polygone de contour (MNT, ortho, semis, courbes, bâti 3D, vecteurs 2D).
- Dessin de polygone ou rectangle à la souris pour l'emprise, sommets déplaçables (retouche fine).
- Terrain mondial (Copernicus GLO-30, MNS 30 m EGM2008, à ne jamais présenter comme équivalent au LiDAR HD) avec détection automatique du fournisseur IGN/monde et UTM automatique hors France. Exports réels validés à Marrakech et Barcelone.
- Vecteurs 2D et bâtiments 3D mondiaux via Overture Maps interrogé en DuckDB (pas de cadastre mondial, hauteur de bâtiment souvent absente donc défaut 3 m).
- Outil LiDAR complet : analyse (pas d'échantillonnage, bbox, EPSG), décimation par pas cible en cm (grille 2D, point le plus bas gardé), tuilage, écriture LAZ 1.4, semis TXT Covadis. Côté API : upload streamé par morceaux, jobs d'analyse et de traitement. Côté front : sélecteur d'outil façon TopoExport, aperçu carte en nuage de points deck.gl sans décodage LAZ navigateur, panneau complet import/analyse/traitement. Validé en réel sur nuage synthétique et E2E.
- Visualiseur 3D plein écran (deck.gl OrbitView) : terrain en vraie surface maillée (SimpleMeshLayer, plus un simple nuage de points) et bâtiments en faces pleines LOD1, slider d'exagération du relief. Profil altimétrique avec 2 clics sur le terrain, export DXF et PDF du profil.
- Fond de plan mondial (OpenFreeMap style liberty) injecté avec les couches IGN par dessus en France, bascule automatique selon la position de la carte, repli sur IGN seul si OpenFreeMap est injoignable.
- Bascule satellite hors France sur Esri World Imagery (voir décision à durée de vie limitée ci dessous).
- Déploiement en production (8 août 2026) : NAS reconstruit avec le build à jour (extras `lidar` et `profil` ajoutés au Dockerfile, l'API expose maintenant `lidar: true` et `profil: true` hors dev). Nom de domaine acheté chez Cloudflare Registrar (prix coûtant, zone créée automatiquement). Tunnel Cloudflare Zero Trust vers le service web interne avec Cloudflare Access (vérification par code email) : les collègues n'installent rien, juste un navigateur et une adresse email autorisée. Accès distant validé en réel.

Recherché mais écarté : aucun MNT 1 m ni LiDAR libre pour Madagascar, le flux monde Copernicus GLO-30 (30 m) est déjà ce qu'il y a de mieux en libre, donc rien à développer spécifiquement.

## Décision à durée de vie limitée : ortho satellite mondiale

Depuis le 7 août 2026, la bascule satellite hors France utilise Esri World Imagery (0,3 à 1 m en zones urbaines, accessible sans clé). Alternatives étudiées et écartées : Sentinel 2 cloudless (mosaïques récentes en licence non commerciale CC BY NC SA), NASA GIBS (résolution 250 à 750 m, inutilisable de près).

Attention : les CGU Esri interdisent l'usage commercial sans licence ArcGIS payante, contrairement à la Licence Ouverte IGN qui autorise explicitement le commercial. Jordan a choisi Esri en connaissance de cause car HYDRA-TOPOS reste en usage interne/perso pour l'instant. Avant tout usage commercial, client ou mise en production BRL : obtenir une licence ArcGIS/Esri en règle, ou retirer la couche `esri-satellite` de `Carte.jsx`. Ne pas lever cette limitation sans revalider explicitement avec Jordan.

## Pièges connus et rappels techniques

- pytest est dans l'extra `dev` (`uv run --extra dev pytest`, ajouter `--extra api` pour l'API).
- Imports lourds (rasterio, ezdxf, osgeo, requests) volontairement différés dans les fonctions pour garder la logique testable hors ligne.
- Écriture GeoTIFF : passer par `engine/export/raster.py::mosaiquer_et_decouper`, le tuilage doit rester multiple de 16 sinon GDAL refuse.
- macOS dev : worker RQ sans fork (`--worker-class rq.SimpleWorker`), sinon SIGABRT. Redis dev sans persistance.
- Vite : `optimizeDeps.exclude: ["maplibre-gl"]` obligatoire, sinon le worker maplibre part en 404 et aucune couche GeoJSON ne se dessine. Terra Draw : coordonnées à 9 décimales maximum.
- Process fantômes : toujours `pkill -9` sur uvicorn et rq worker avant validation, et vérifier `/api/sante` avant de conclure quoi que ce soit. Un ancien process qui squatte le port 8000 avec d'autres variables d'environnement fait lire à l'API un dossier et écrire au worker dans un autre, d'où des 404 trompeurs.
- deck.gl : l'onClick interne n'émet pas en OrbitView, il faut écouter le clic DOM puis `deck.pickObject`. Sur une surface maillée (SimpleMeshLayer) le picking renvoie `info.coordinate`, pas `info.index` (contrairement à un nuage de points).
- Playwright et WebGL headless : lancer chromium avec `--use-gl=angle --use-angle=swiftshader --enable-unsafe-swiftshader`.
- `src.crs.to_epsg()` peut renvoyer None sur les MNT IGN (CRS en WKT sans code EPSG) : toujours reprojeter depuis l'objet CRS lui même, jamais via un code EPSG supposé.
- `set_gdal_config_options` est global : toujours remettre les options à None dans un bloc finally, sinon une lecture suivante peut casser silencieusement.
- Volume de données persistant du NAS : les dossiers d'import LiDAR et de scènes 3D doivent y être raccordés explicitement, sinon perdus à chaque reconstruction de l'image Docker.
- Token de tunnel Cloudflare copié depuis l'assistant : vérifier l'absence de chevrons parasites et de ligne vide en double dans le fichier de config, sinon le tunnel est invalidé silencieusement.
- La commande de déploiement lancée depuis la racine du projet ne lit pas le fichier `.env` par défaut : toujours préciser explicitement quel fichier de config utiliser, sinon les variables retombent sur leurs valeurs par défaut sans erreur visible (bug présent depuis le tout premier déploiement, non détecté jusqu'au 8 août 2026).

## À faire, par priorité décroissante

1. Découper l'upload LiDAR par morceaux côté navigateur : le tunnel Cloudflare plafonne chaque requête à environ 100 Mo, devenu bloquant maintenant que l'accès distant est en usage réel.
2. Validation métier réelle dans Covadis/AutoCAD : ouvrir les DXF d'un export (courbes, semis, profil), vérifier l'offset origine locale. Passer aussi un vrai nuage LiDAR métier dans l'outil et contrôler dans CloudCompare.
3. Phase 3 lots 3b et 3c : géocodage Photon en secours hors France dans la barre de recherche, E2E playwright sur un cas monde complet (recherche, export terrain/vecteurs/3D).
4. Faire tester l'interface par un collègue non SIG (DoD phase 1).
5. Fallback RGE ALTI 1 m quand des trous de couverture LiDAR HD sont détectés.
6. Purge automatique des exports, imports et aperçus 3D anciens, finitions front (préchauffage des imports géo, i18n des erreurs).

Pistes évoquées avec Jordan, non tranchées : bâtiments du visualiseur 3D en vraie extrusion volumique, ortho drapée sur le MNT en France, profil altimétrique multi segments.

Démo de présentation en préparation, à titre d'exemple personnel : voir [[POC-IA5 - HYDRA-TOPOS]].
