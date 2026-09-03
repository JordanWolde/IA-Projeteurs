---
id: 20260809-2203
title: POC-IA7 - Comptes rendus de réunion
type: projet
domain: ia
status: stable
created: 2026-08-09
updated: 2026-09-03
tags:
  - projeteur
  - poc
  - reunion
  - teams
  - anonymisation
summary: Fiche et suivi du POC de comptes rendus de réunion Teams par IA (transcription native collée dans Claude), avec anonymisation des intervenants avant envoi au LLM. Mené en août-septembre 2026.
parent: "[[L'IA dans le métier de projeteur]]"
next: Mettre en place l'anonymisation automatique du transcript avant le prochain essai chronométré
echeance: 2026-09-08
revu: true
---

## Contexte et problématique

Les comptes rendus de réunion sont aujourd'hui rédigés à la main après coup, à partir de notes prises en direct ou de mémoire, ce qui prend du temps et laisse passer des détails (décisions, actions, qui fait quoi). Les réunions se tiennent sur Teams, qui propose une transcription automatique native gratuite, indépendante de Copilot (non disponible dans l'équipe). Ce POC teste si cette transcription brute peut être transformée en CR structuré via Claude, sans licence Copilot, et sans exposer les noms réels des participants à un LLM cloud.

## Objectif(s) / hypothèses à tester

Un CR de réunion (ordre du jour reconstitué, décisions, actions, responsables) peut-il être produit par IA à partir de la seule transcription native Teams, plus vite qu'une rédaction manuelle, avec une fidélité suffisante pour être diffusé sans reprise lourde ?

L'anonymisation des intervenants avant envoi à Claude peut-elle être fiabilisée sans alourdir excessivement le processus ?

## Périmètre

Inclus : réunions internes non sensibles (points d'équipe, suivis de projet courants) ; transcription Teams native uniquement (pas de Copilot) ; passage par Claude (licence Pro déjà active) avec anonymisation préalable des intervenants.

Exclu : réunions avec client ou données projet sensibles tant que l'anonymisation n'est pas fiabilisée.

## Critères de succès mesurable

- Temps de rédaction du CR nettement inférieur à une prise de notes manuelle (cible : divisé par 2 au moins).
- CR jugé exploitable sans reprise lourde par au moins un participant.
- Anonymisation des intervenants faite sur 100 % des tests, sans qu'aucun nom réel ne parte vers Claude.

## Critères d'arrêt

Anonymisation qui prend plus de temps que la rédaction manuelle du CR, ou transcription trop dégradée (jargon métier, recouvrements de parole) pour être exploitable sans relecture lourde.

## Boucle de validation humaine

Relecture systématique du CR généré avant diffusion, en particulier des décisions et de l'attribution des actions (une erreur d'attribution est plus grave que dans un résumé de document), puis réintégration des vrais noms en local, jamais renvoyés à Claude.

## Méthodologie / approche technique

1. Transcription native Teams activée pendant la réunion (gratuite, indépendante de Copilot).
2. Récupération du transcript depuis le panneau Teams (copier-coller).
3. Anonymisation des intervenants avant envoi à Claude : Teams préfixe chaque réplique du nom complet. Remplacer ces noms par un identifiant générique (Intervenant 1, Intervenant 2...) avant collage, pour limiter l'exposition de données nominatives à un LLM hébergé aux Etats-Unis, malgré la clause de non-entraînement de Claude Team. Le premier essai (début août 2026) n'a pas fait cette étape : à corriger avant tout test sur une réunion avec des tiers externes.
4. Collage du transcript anonymisé dans Claude avec un prompt de structuration : ordre du jour reconstitué, décisions, actions avec responsable si identifiable, points en suspens.
5. Relecture humaine et réintégration des vrais noms dans le CR final, en local.

Piste écartée pour ce POC mais notée pour une suite : un agent Claude Code qui prend un fichier `.md` de transcript brut, anonymise, structure le CR et écrit directement la note finale dans le coffre (type `log`).

## Ressources nécessaires

Licence Claude Pro déjà active. Pas de licence Copilot Teams (transcription native uniquement). Quelques réunions internes réelles à utiliser comme matière de test.

## Planning

Environ 4 semaines, du 9 août au 8 septembre 2026.

## Livrables attendus

Un prompt de structuration de CR réutilisable, une méthode d'anonymisation fiabilisée, et un bilan chiffré (temps gagné, fidélité) sur 2 à 3 réunions réelles.

## Risques et limites connues

- Qualité de la transcription native Teams (sans Copilot) sensible aux accents, aux recouvrements de parole et au jargon métier (BIM, hydraulique) mal orthographié.
- Anonymisation manuelle fastidieuse sur une réunion longue : sans automatisation fiable, risque d'être sautée sous pression de temps, ce qui annule la précaution.
- CR partiellement halluciné ou décision mal attribuée : risque propre à ce type de document, relecture humaine systématique avant diffusion non négociable.
- Le POC ne teste pas Copilot Intelligent Recap faute de licence : pas de comparaison possible avec la solution native Microsoft pour l'instant.

## Suivi

Une ligne par réunion testée.

| Date | Réunion testée | Anonymisation faite | Temps manuel estimé | Temps avec IA | Remarque |
| ---- | --------------- | -------------------- | -------------------- | -------------- | -------- |
|      |                 |                       |                       |                |          |

## Conclusion / recommandation

POC en cours (démarré le 9 août 2026). Un seul essai informel avant la rédaction de cette fiche, sans anonymisation ni mesure de temps : pas de verdict possible à ce stade. Prochaine étape : fiabiliser l'anonymisation, puis chronométrer 2 à 3 réunions réelles.

### Suite si succès

Automatiser le dépôt : un skill claude qui anonymise, structure le CR et range la note dans le coffre (type `log`, `date_evenement`, `projet`). 
Tester ensuite Copilot Intelligent Recap si une licence est acquise, pour comparer.
