---
id: 20260729-2014
title: POC-IA2 - Analyse CCTP
type: projet
domain: ia
status: stable
created: 2026-07-29
updated: 2026-09-03
tags:
  - projeteur
  - poc
  - cctp
summary: POC d'extraction des exigences d'un CCTP par IA (livrables, formats, chartes, paramètres BIM) via skill Claude dédié, testé sur 2 CCTP anonymisés. Verdict GO, sous réserve de retravailler le skill pour limiter sa consommation de tokens.
parent: "[[L'IA dans le métier de projeteur]]"
next:
echeance: 2026-08-22
revu: true
---
## Contexte et problématique

En début d'affaire et avant chaque rendu, les exigences documentaires d'un CCTP ou plus largement d'un programme (livrables attendus, formats, chartes, paramètres BIM imposés) sont relevées manuellement et confrontées à la liste des livrables. Ce relevé est long et une exigence dispersée ou implicite peut passer à la trappe. La note de veille présentée fin juillet identifie ce contrôle croisé pièces écrites ↔ livrables comme le cas d'usage IA le plus mûr du panorama : **Utilisable**, sur données non sensibles ou anonymisées.

## Objectif(s) / hypothèses à tester

L'IA extrait les exigences d'un CCTP plus vite et plus complète qu'une relecture manuelle.

## Périmètre

**Inclus :** 1 à 2 CCTP anonymisés ou non sensibles, confrontés à la liste des livrables et aux solutions techniques prises d'une affaire. Extraction des exigences documentaires : livrables attendus, formats, chartes, paramètres BIM imposés (côté projeteur).

**Exclu :** Toute pièce sensible ou non anonymisée (niveaux 3-4 de la grille de sécurité des données). La vérification géométrique de maquette (cotes, superpositions, accrochages) : hors périmètre de ce POC, notée comme piste d'extension séparée ci-dessous.

## Critères de succès mesurable

Temps d'extraction divisé par 2 par rapport à la relecture manuelle. Au moins une exigence oubliée détectée par l'IA qui serait passée à la trappe en relecture manuelle classique.

## Critères d'arrêt

Taux d'exigences ratées par l'IA trop élevé, ou temps de vérification humaine des résultats qui annule le gain de temps.

## Boucle de validation humaine

Chaque liste d'exigences extraite par l'IA est relue avant tout usage en affaire réelle, conformément à la règle d'or de la note de veille : l'IA propose, le destinataire vérifie et valide. L'écart entre exigences extraites par l'IA et exigences réellement présentes dans le CCTP (faux négatifs, faux positifs) alimente directement le tableau de suivi ci-dessous.

## Méthodologie / approche technique

Licence Claude Pro déjà active. Soumission du CCTP (ou d'extraits anonymisés) à l'assistant avec une consigne d'extraction structurée des exigences, puis confrontation manuelle au résultat attendu (liste de livrables, conventions, normes).

Création d'un skill Claude avec les consignes principales suivantes :

- Résumer le projet en bref.
- Lister les incohérences.
- Lister les pièges.
- Lister les plus-values possibles.
- Détailler les exigences par thèmes/métier.
- S'adapter à chaque métier (demandé en début de session) pour bien saisir le destinataire.

## Ressources nécessaires

Licence Claude Pro déjà active. CCTP anonymisés fournis.

## Planning

3 à 4 semaines, initialement prévu en août 2026. Échéance fixée au 2026-08-22, dépassée à ce jour : aucune entrée de suivi n'a encore été renseignée, à recadrer avant relance.

## Livrables attendus

Tableau de suivi rempli (voir ci-dessous) sur 1 à 2 CCTP testés, et un verdict argumenté sur la généralisation du contrôle croisé pièces écrites ↔ livrables.

## Risques et limites connues

Les exigences implicites ou dispersées dans le CCTP peuvent échapper à l'extraction : la liste générée se relit systématiquement, elle ne se diffuse jamais telle quelle. Le POC valide la faisabilité sur 1 à 2 CCTP, pas la robustesse sur la diversité réelle des pièces de marché rencontrées en affaire.

## Suivi

| Date       | CCTP testé   | Temps manuel estimé | Temps avec IA                       | Exigence(s) détectée(s) manquante(s)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------- | ------------ | ------------------- | ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 25/08/2026 | M5 anonymisé | 1 à 2 jour          | 1.5 heures (vérifications incluses) | Ne s'est concentré que sur les exigences les plus importantes financièrement et structurellement parlant. A omis des exigences très sommaires sur des petits éléments (ex Organeaux, échelles) mais l'a pris en compte dans son résumé final.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 01/09/2026 | PSL          | 1 à 2 jour          | 1.5 heures (vérifications incluses) | Suite à des retouches sur le modèle, il a été beaucoup trop précis et est allé beaucoup trop loin, ce qui a termes peut juste faire perdre du temps car qui dit plus de matière dit plus de vérifications à faire. Sur le plan technique il n'a fait aucune erreur, aucun oubli. Il a trouvé de lui même exactement les points bloquants/pièges qu'on a découvert par nous même pendant les études. Il y a même des éléments que l'on avait pas relevé de nous même. Au delà d'un outil qui rassemble et résume de la donnée, il permet également d'avoir un oeil neuf et neutre sur un projet nouveau pour lui contrairement à nous.<br>Utilisation de tokens massif (1 session entière consommée pour chaque demande), à reprendre. |

## Conclusion / recommandation

**Verdict : GO, sous réserve de retravailler le skill.** Sur les deux CCTP testés, les deux critères de succès sont largement dépassés : temps divisé par 10 à 15 (au lieu de 2 visé), et détection sur le test PSL de points bloquants que l'équipe avait elle-même identifiés en études, plus d'autres qu'elle n'avait pas relevés. Le point qui bloque la généralisation n'est pas la fiabilité de l'extraction mais la consommation de tokens (une session entière par demande sur le test PSL) : c'est cette condition qui fait basculer le verdict de GO simple à GO conditionnel.

Les modèles les plus récents (ici Opus 5) sont maintenant largement en capacité de traiter et d'analyser autant de données grâce à un nombre de paramètres de plus en plus conséquent tout en réduisant la taille des modèles.
Cet augmentation constante du nombre de paramètres limite les oublis et erreurs car la capacité d'analyse (et notamment le débit de token) est plus élevé.
Le système par agents est optimal pour les travaux d'analyse, plutôt que de faire travailler une seule instance.
Un travail conséquent d'optimisation est requis pour canaliser le modèle, orienter les réponses selon le métier et limiter sa consommation.

### Suite si succès

Retravailler le skill pour limiter la consommation de tokens avant toute généralisation (constat test PSL : une session entière consommée par demande).
Généralisé en début d'affaire, sans pour autant arrêter la vérification humaine.
Travail en collaboration avec les différents métiers (ingénieurs, commerciaux, AP, projeteurs) pour affiner le modèle à chaque type de métier.
Piste d'extension notée : vérification de maquette sur base CCTP/PTFD.