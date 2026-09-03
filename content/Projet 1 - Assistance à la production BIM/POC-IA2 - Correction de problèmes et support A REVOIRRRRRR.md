---
id: 20260729-2014
title: POC - Scripts Dynamo Python
type: projet
domain: ia
status: draft
created: 2026-07-29
updated: 2026-08-07
tags:
  - projeteur
  - poc
  - dynamo
summary: Fiche et suivi du POC de scripts Dynamo/Python assistés par IA (contrôle, renommage en masse, export de nomenclature), mené en août 2026 sur une maquette de travail.
parent: "[[L'IA dans le métier de projeteur]]"
next: Écrire et tester le premier script de contrôle sur une maquette de travail
echeance: 2026-08-26
revu: false
---
## Fiche

| Champ | Contenu |
|---|---|
| Hypothèse | Un assistant IA réduit le temps d'écriture de scripts Dynamo/Python de contrôle, de renommage en masse et d'export de nomenclature, sans perte de fiabilité. |
| Périmètre | 1 maquette de travail (pas un projet client) : contrôle de paramètres, renommage en masse, export de nomenclature. |
| Durée | 4 semaines — août 2026. |
| Critère de succès | Temps d'écriture divisé par 2 par rapport à l'écriture manuelle ; au moins 3 scripts capitalisés en bibliothèque ; zéro script poussé en prod sans relecture. |
| Critère d'arrêt | Le temps de relecture et de correction dépasse le temps gagné à l'écriture. |
| Ressources | Licence Claude Pro déjà active ; ~1-2h/semaine de Jordan. |
| Suite si succès | Bibliothèque de scripts partagée avec l'équipe (rejoint le portefeuille production BIM de la note de veille). |

## Suivi

Une ligne par script testé — sans ce log, pas de chiffres à présenter le 8 septembre.

| Date | Script / tâche | Temps manuel estimé | Temps avec IA | Remarque |
|---|---|---|---|---|
| | | | | |
## 5. Correction de problèmes et support

Utiliser l'assistant comme premier réflexe face à un problème : message d'erreur AutoCAD/Revit/Allplan, avertissement Revit, fichier corrompu, comportement anormal, question de procédure. Concrètement : coller le message d'erreur et obtenir une explication avec des pistes hiérarchisées, faire analyser un journal, déboguer un script Dynamo/AutoLISP existant, retrouver une procédure sans écumer les forums.

Déblocage en minutes au lieu d'heures, montée en compétence de toute l'équipe, désengorgement des référents internes. Réserve : sur des versions très récentes ou des configurations exotiques, les réponses peuvent être datées ou fausses — croiser avec la doc éditeur au moindre doute. Et ne jamais coller de contenu projet sensible : décrire le problème suffit presque toujours.

**Verdict : utilisable.** Le gain le plus immédiat et le moins risqué de tout le panorama.

À noter : les assistants intégrés des éditeurs (Autodesk Assistant, AI Assistant d'Allplan Connect) jouent le même rôle de support, directement dans le logiciel et sans surcoût. Les deux approches se complètent.