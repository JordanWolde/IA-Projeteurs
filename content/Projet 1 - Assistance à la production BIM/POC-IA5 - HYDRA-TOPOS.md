---
id: 20260808-1852
title: POC - HYDRA-TOPOS
type: projet
domain: ia
status: stable
created: 2026-08-08
updated: 2026-09-03
tags:
  - poc
  - projeteur
summary: Préparation d'une démo de HYDRA-TOPOS à titre d'exemple de ce que Claude Code permet de produire, hors de toute commande BRL. Note volontairement séparée du portefeuille officiel IA Projeteur pour ne pas documenter de lien avec la fonction.
parent: "[[HYDRA-TOPOS]]"
next: Décider du format de démo (capture préparée ou démonstration en direct) et choisir 2-3 exports représentatifs à montrer.
revu: true
---

## Contexte et problématique

Démo/vitrine du projet personnel [[HYDRA-TOPOS]], présentée à titre d'exemple de ce que Claude Code permet de produire en dehors de toute commande de BRL. Volontairement distincte du portefeuille officiel [[L'IA dans le métier de projeteur]] : pas un POC BRL, pas envoyé à la direction pour validation, pas rattaché à la mission de référent IA.

## Objectif(s) / hypothèses à tester

Montrer par l'exemple ce qu'un projeteur débutant en code peut produire avec Claude Code, sur un projet mené intégralement hors temps de travail.

## Périmètre

Inclus : présentation informelle du projet personnel [[HYDRA-TOPOS]].

Exclus : ne figure pas dans le paquet officiel envoyé pour l'arbitrage des POC IA Projeteur. Positionnement à tenir : projet personnel (régime `P`), développé sur temps et matériel perso, sans donnée ni instruction BRL. Ce n'est pas un livrable ou une initiative de la mission de référent IA (car démarré bien avant).

## Critères de succès mesurable

- Interface fonctionnelle et conforme aux attentes.
- Code clair et lisible.
- Stack maintenable dans le temps.
- Simplicité d'utilisation.
- Simplicité de création.

## Critères d'arrêt

- Interface pas conforme aux attentes.
- Données erronées dans les outputs

## Boucle de validation humaine

La procédure que suit l'outil peut être réalisée manuellement pour comparer et vérifier les outputs.
Chaque export sera contrôlé par une information tangible du projet en question (coordonnées, altimétries ou autre).

## Méthodologie / approche technique

1. Décider du format de démo : capture d'écran/vidéo préparée, ou démonstration en direct.
2. Choisir 2 à 3 exports représentatifs à montrer plutôt que dérouler la liste complète des phases (ex. courbes de niveau + semis LiDAR).
3. Écrire un script de présentation court (5-10 min), aligné sur le format des autres démos de l'équipe.
4. Relire ce script à la lumière de la section "Risques et limites connues" avant toute présentation.

## Ressources nécessaires

Aucune à mobiliser : le projet est déjà déployé et accessible (domaine + tunnel Cloudflare).

## Planning

Présentation informelle envisagée, éventuellement au même créneau que la présentation aux relais numériques (8 septembre 2026, à confirmer).

## Livrables attendus

À définir : capture ou démonstration en direct de l'export (carte, dessin d'emprise, ZIP obtenu), quelques chiffres factuels (phases livrées, volume de tests).

## Risques et limites connues

La démo s'appuie sur l'état réel de [[HYDRA-TOPOS]] au 8 août 2026 (phases 0 à 2 validées en réel, phase 3 largement engagée). Ce que cet état ne couvre pas encore :

- Durcissement non commencé (phase 4) : pas de quotas, pas d'authentification au delà de la vérification par email de Cloudflare Access, pas de monitoring. Déploiement pensé pour un usage interne restreint, pas pour une exposition large.
- Upload LiDAR plafonné à environ 100 Mo par le tunnel Cloudflare : à éviter en démonstration live si un import LiDAR volumineux est prévu.
- Validation métier CAO partielle : phases 0 et 1 validées en réel dans QGIS/AutoCAD/Covadis, validation métier complète des phases 2 (LandXML, bâtiments 3D) et 3 (monde) encore à faire.
- Aucun test de charge ni d'usage concurrent réalisé : la démo prouve la faisabilité fonctionnelle sur un usage individuel, pas la scalabilité.
- Couche satellite mondiale (Esri World Imagery) sous CGU non commerciales : limite de licence connue, à ne pas présenter comme solution définitive.

## Suivi

Voir [[HYDRA-TOPOS]].
## Conclusion / recommandation

Outil déjà pleinement développé et utilisable à une échelle interne (si le besoin s'en fait sentir).
### Suite si succès

Décider, avec un avis juridique en poche, si une mise à disposition a du sens. Pas avant.
