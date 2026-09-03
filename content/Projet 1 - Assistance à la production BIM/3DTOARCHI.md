---
id: 20260811-1630
title: 3DTOARCHI
type: note
domain: ia
status: draft
created: 2026-08-11
updated: 2026-08-11
tags:
  - projeteur
  - poc
  - allplan
  - pythonpart
parent: "[[POC-IA1 - Génération de scripts]]"
summary: "Bilan d'un POC (arrêté le 2026-08-11) testant si une IA sans accès direct à Allplan pouvait développer un PythonPart de recopie de format/proprietes/attributs entre éléments d'architecture. Verdict : script fonctionnel sur les attributs, mais bloqué par une limite non documentée de l'API Allplan sur le Format et les Propriétés."
revu: false
---

# 3DTOARCHI

Ligne de suivi dans [[POC-IA1 - Génération de scripts]] (2026-08-11). Bilan détaillé du test : script pas fonctionnel en l'état, blocage identifié comme une limite d'Allplan et non du domaine de compétence projeteur.

## Objectif du POC

Tester si une IA (Claude, sans accès direct à Allplan) pouvait développer seule un PythonPart capable de :
1. convertir un volume 3D en élément d'architecture personnalisé,
2. lui recopier le format, les propriétés et les attributs d'un élément gabarit,
3. avec la possibilité de saisir une désignation à la volée.

## Ce qui a été construit

Un PythonPart complet (`3DTOARCHI.py` + `3DTOARCHI.pyp`, contrat *Interactor*) avec une machine à états à deux étapes (sélection cible puis gabarit), une palette de propriétés (cases à cocher Format / Propriétés / Attributs, saisie de désignation, mode diagnostic) et un mode diagnostic écrivant un log détaillé (classe Python réelle des éléments manipulés, valeur avant/après pour chaque champ recopié, raison exacte de chaque échec, trace complète en cas d'exception).

Ce mode diagnostic a été le seul canal d'information disponible pendant tout le projet : aucun accès à une machine Allplan côté IA. Toute l'investigation s'est faite par cycles "modification du code, redéploiement et test dans Allplan côté Jordan, dépôt du log, lecture et ajustement côté IA", nettement plus lent qu'un accès direct mais qui a quand même permis d'aller assez loin.

## Ce qui fonctionne

- **Recopie des attributs** : fiable dès les premiers tests réels (31 à 37 attributs recopiés selon l'élément, filtrage correct des attributs à exclure).
- **Changement de calque** : fiable (`ElementsLayerService.ChangeLayer`).
- Plusieurs vrais bugs de code trouvés et corrigés en cours de route (méthode d'API inexistante appelée pour la désignation, sélection qui ne réarmait pas correctement l'entrée, signatures d'API obsolètes).

## Ce qui ne fonctionne pas, et pourquoi

**1. La conversion automatique (volume 3D vers élément d'architecture) ne fait rien.** `ElementConverter.ConvertToUDElement` s'exécute sans erreur mais ne convertit rien (élément renvoyé identique à l'élément d'entrée, confirmé sur deux éléments distincts). Aucune trace d'un usage réel de cette fonction dans la documentation, les exemples officiels ou le forum Allplan. La commande manuelle équivalente fonctionne parfaitement. Contournement trouvé : convertir l'élément à la main avant de lancer le script.

**2. Même sur un vrai élément d'architecture, le Format et les Propriétés ne passent pas, et ça n'a pas de contournement côté script.** C'est la découverte la plus importante du POC. Testé sur deux éléments authentiquement déjà de type "élément d'architecture personnalisé" : `GetElements()` renvoie une liste vide pour ce type d'élément (donc aucune propriété d'archi lisible ni inscriptible par ce chemin), et l'*adapter* obtenu par sélection directe n'expose qu'une trentaine de méthodes en lecture seule (une seule méthode d'écriture, sans rapport avec le besoin). Allplan n'expose donc, à ce jour, aucune méthode Python documentée pour écrire le Format ou les Propriétés d'archi sur ce type d'élément : ce n'est pas un bug du script, c'est une limite de l'API. La fonction candidate (`ModifyFormatProperties`) a un premier paramètre dont le format n'est documenté nulle part ; une tentative pour le deviner a fait planter Allplan une fois, non retentée depuis.

**3. L'alternative native existe, mais n'est pas scriptable.** La commande native "Modifier un élément d'architecture, paramètres" fait exactement ce que le script visait (reprise de Format + Propriétés + Désignation d'un élément gabarit sur une sélection, y compris multi-sélection, confirmée fonctionnelle). C'est la meilleure solution pratique disponible aujourd'hui pour cette partie du besoin, mais elle reste une action manuelle : aucune fonction Python trouvée pour la déclencher depuis un script.

## Verdict

L'IA a su écrire et maintenir un PythonPart propre, diagnostiquer et corriger de vrais bugs, mener une recherche documentaire méthodique (doc multi-versions, exemples GitHub, forum développeur Allplan) et de l'introspection Python pour explorer les modules non documentés, formuler et tester des hypothèses une à une, puis reconnaître une limite structurelle de la plateforme plutôt que de continuer à deviner un format d'API non documenté.

Ce qu'elle n'a pas pu faire : contourner une limite réelle de l'API Allplan sur les propriétés d'archi (Format/Propriétés), qui n'a, à notre connaissance, aucune solution côté Python à ce jour, avec ou sans IA. Le facteur qui a le plus pesé sur la vitesse d'investigation n'est pas la capacité de raisonnement mais l'absence d'accès direct à Allplan côté IA : chaque hypothèse nécessitait un cycle complet modification, redéploiement, test manuel, lecture de log, au lieu d'une vérification immédiate.

## Pour repartir un jour, si besoin

- Dossier de preuves technique complet (logs, docstrings, hypothèses testées et infirmées une à une, dates) dans `CLAUDE.md` à la racine du projet réel (`01_PROJETS/3DTOARCHI/`), ainsi que le bilan source de cette note dans `BILAN_POC.md` au même endroit.
- Piste non épuisée : contacter le support Allplan/Nemetschek avec ce dossier pour demander le format exact attendu par `ModifyFormatProperties`, ou toute autre API officielle de modification des propriétés d'archi sur ce type d'élément.
- Solution pratique immédiate en l'absence de script : commande native "Modifier un élément d'architecture, paramètres" (Format/Propriétés/Désignation, multi-sélection) combinée au script actuel pour les Attributs uniquement.
