---
id: 20260729-2013
title: POC - Génération de scripts
type: projet
domain: ia
status: stable
created: 2026-07-29
updated: 2026-08-11
tags:
  - projeteur
  - poc
  - dynamo
  - allplan
  - autolisp
summary: Fiche et suivi du POC de scripts assistés par IA (Dynamo/Python sur Revit, Python sur Allplan, AutoLISP sur AutoCAD/Covadis) pour le contrôle, le renommage en masse et l'export de nomenclature, mené en août 2026 sur une maquette de travail.
parent: "[[L'IA dans le métier de projeteur]]"
next: Écrire et tester le premier script de contrôle sur une maquette de travail
echeance: 2026-08-26
revu: true
---
## Contexte et problématique

Les scripts de contrôle, de renommage en masse et d'export de nomenclature sont écrits à la main aujourd'hui, sur trois environnements différents (Dynamo/Python sur Revit, Python sur Allplan, AutoLISP sur AutoCAD/Covadis), ce qui prend du temps et se refait d'une maquette à l'autre. Ce POC teste si un assistant IA (Claude) permet d'aller plus vite sur ces trois usages, sur les trois environnements, sans introduire d'erreurs dans les scripts produits.

## Objectif(s) / hypothèses à tester

Peut-on réduire le temps d'écriture de scripts de contrôle, de renommage en masse ou divers avec un assistant IA, que ce soit en Dynamo/Python (Revit), en Python (Allplan) ou en AutoLISP (AutoCAD/Covadis), sans perte de fiabilité par rapport à l'écriture manuelle ?

Est-ce plus confortable de développer un script en étant assisté par l'IA ?

## Périmètre

Inclus : écriture assistée par IA de scripts (Dynamo/Python Revit, Python Allplan, AutoLISP AutoCAD/Covadis), testés sur une maquette de travail interne. 

Exclu : tout script poussé sur un projet client sans relecture, et l'intégration en bibliothèque officielle (viendrait après, en cas de succès).

## Critères de succès mesurable

- Temps d'écriture réduit par rapport à l'écriture manuelle. 
- Moins de 5 reprises/ allers-retours avec l'IA pour d'éventuels bugs (qui mettrait en péril la confiance et ferai perdre du temps).
- Au moins 1 script capitalisé par environnement (Dynamo/Python, Python Allplan, AutoLISP), soit 3 au minimum. Zéro script poussé en prod sans relecture.

## Critères d'arrêt

Le temps de relecture et de correction dépasse le temps gagné à l'écriture.

## Boucle de validation humaine

Relecture et test de chaque script sur la maquette de travail avant tout usage réel. L'IA propose le script, puis validation ou correction avant exécution. Aucun script ne part en prod sans cette relecture.

## Méthodologie / approche technique

Claude (licence Pro déjà active) pour générer et itérer sur les scripts, à partir de besoins concrets identifiés sur la maquette de travail, environnement par environnement (Dynamo/Python, Python Allplan, AutoLISP). Tests directs sur la maquette, pas sur un projet client. IA intégrées d'Autodesk/Nemetschek écartées pour le moment.

Test de scripts de 3 complexités différentes :

- Fonction simple (combine 2-3 commandes basique)
- Fonction intermédiaire avec des allers-retours entre l'utilisateur et le code et éventuellement import/export de données.
- Outil complet avec interface visuelle (DCL, Plugin Revit, Propriétés Allplan)

## Ressources nécessaires

Licence Claude Pro déjà active. Environ 1 à 2h par semaine de temps de projeteur dès qu'une idée émerge.

## Planning

4 semaines, du 29 juillet au 26 août 2026.

## Livrables attendus

Un rapport de synthèse (temps gagné, fiabilité) et au moins 3 scripts capitalisés en bibliothèque.

## Risques et limites connues

Le POC valide la faisabilité sur une maquette de travail, pas sur un projet client réel. Il ne prouve ni la robustesse en prod, ni la portabilité vers d'autres familles Revit. La fiabilité de l'IA peut varier selon l'environnement : Dynamo/Python est très documenté, la Python API d'Allplan (PythonParts) beaucoup moins, AutoLISP est ancien mais bien couvert. À surveiller script par script plutôt qu'à supposer un niveau uniforme.

## Suivi

Une ligne par script / tâche testé.

| Date       | Script / tâche  | Temps manuel estimé                                                                                              | Temps avec IA                                                                                                                                                | Remarque                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Gain final                                                                                                                                                                           |
| ---------- | --------------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 2026-07-22 | SELEXT          | Plusieurs dizaines minutes si contour n'est pas rectangulaire.                                                   | Production / vérification / test du script : 30 minutes et à l'utilisation : 10 secondes.                                                                    | Script simple tout à fait fonctionnel. Gain réel constaté. Usage en prod. Fonctionnel au premier essai. Sans compter le confort de ne plus avoir à se triturer le cerveau pour ne pas faire d'erreur de manipulation.                                                                                                                                                                                                                                               | En supposant 15min en moyenne par sélection et un usage 2x par semaine : près de 26 heures économisées chaque année par projeteur.                                                   |
| 2026-07-28 | NICOU           | Quelques minutes selon la quantité de cote à placer. Calcul de l'altimétrie à chaque itération. Erreur possible. | Production / vérification / test du script : 1 heure incluant le dessin du bloc nécessaire à la commande. A l'utilisation : quelques secondes (clic-dépose). | Script fonctionnel. Peut être étoffé si le besoin s'en fait sentir. Gain réel constaté. Fonctionnel au premier essai. Usage en prod. Evite les erreurs.                                                                                                                                                                                                                                                                                                             | En supposant 3min pour placer 5 cotes et un usage 5x par semaine : 13 heures économisées chaque année par projeteur.                                                                 |
| 2026-03-27 | MASTER<br>_REV  | Plusieurs heures sur gros projet.                                                                                | Production / vérification / test du script : 3 heures et à l'utilisation : 30 secondes.                                                                      | Script fonctionnel. Développé sur temps personnel. Peut être étoffé si le besoin s'en fait sentir. 3-4 allers-retours pour régler correctement la fenêtre DCL (juste visuel pas de back-end erroné). Gain réel constaté. Fonctionnel au premier essai (hors DCL). Usage en prod dès que possible. Evite les erreurs.                                                                                                                                                | En supposant 1 min par cartouche. Production de 2 plans par jour qui a en moyenne 3 indices : 34 heures économisées chaque année par projeteur.                                      |
| 2026-06-24 | Decoupe<br>_STL | Plusieurs heures selon la complexité du bassin. Calcul de chaque couche à la main...                             | Production / vérification / test du script : 2 heures et à l'utilisation : 1 min.                                                                            | Script fonctionnel. Développé sur temps personnel. Peut être étoffé si le besoin s'en fait sentir. 2-3 allers-retours pour régler  l'export DXF qui ne fonctionnait pas correctement. Puis 2-3 allers-retours pour régler correctement la fenêtre d'affichage de l'outil (juste visuel pas de back-end erroné). Gain réel constaté. Usage en prod (car besoin). Evite les erreurs d'interprétation. Gain maximal si plusieurs itérations (à la main 2 ou 3 maximum) | Utile seulement sur les projets avec de l'hydraulique. 1 utilisation par an; très intuitif même après longue période d'inutilisation. Temps gagné : 4-8 heures par projeteur par an. |
| 2026-08-11 | [[3DTOARCHI]]   | 30 secondes plusieurs fois par jour.                                                                             | Production (abortée) : 6 heures. Temps gagné si fonctionnel : 10s et multi sélection possible donc gain encore plus considérable que 20s.                    | Script pas fonctionnel en l'état dû à des limitations à priori d'allplan mais cela sort de mon domaine de compétences.                                                                                                                                                                                                                                                                                                                                              |                                                                                                                                                                                      |

## Conclusion / recommandation

POC en cours (démarré le 29 juillet 2026). Aucun script testé au moment de la rédaction, le tableau de suivi n'a pas encore de première ligne. Conclusion à rendre après la période, avant le 26 août 2026.

3D to archi (partie allplan) : 
Manque d'accès direct à allplan et de doc, difficultés à vérifier le code python.
Code pas fonctionnel en l'état. IA dit que c'est une limitation logicielle mais doute
### Suite si succès

Bibliothèque de scripts partagée avec l'équipe (rejoint le portefeuille production BIM de la note de veille).
