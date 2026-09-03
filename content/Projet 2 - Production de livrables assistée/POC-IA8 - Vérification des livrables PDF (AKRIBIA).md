---
id: 20260807-1620
title: Vérification des livrables PDF
type: projet
domain: ia
status: draft
created: 2026-08-07
updated: 2026-08-10
tags:
  - projeteur
  - poc
  - akribia
  - livrables
summary: Fiche et suivi du POC de vérification de livrables PDF (plans et notes) par IA, en sortie JSON FQC (AKRIBIA, ex AKRIBIA) ou modèle Markdown générique pour les non-utilisateurs de l'outil, mené en août-septembre 2026.
parent: "[[L'IA dans le métier de projeteur]]"
next: Rédiger le modèle Markdown générique de vérification (miroir du schéma JSON FQC) et réunir les documents de test (2 plans, 2 notes)
echeance: 2026-09-04
revu: false
---

## Fiche

| Champ | Contenu |
|---|---|
| Hypothèse | L'IA vérifie un livrable PDF (plan ou note) et produit une sortie structurée fiable, que ce soit le JSON FQC (AKRIBIA) ou un modèle Markdown générique pour ceux qui n'ont pas l'outil, plus vite qu'une vérification manuelle. |
| Périmètre | 4 combinaisons testées : JSON FQC × plan, JSON FQC × note, MD générique × plan, MD générique × note. Au moins 2 documents de test par type (plan / note), maquettes ou documents non sensibles. |
| Durée | 4 semaines, du 7 août au 4 septembre 2026 (buffer avant la présentation du 8/09). |
| Point d'étape | Au 21 août (mi-parcours) : au moins une combinaison doit tenir son critère de succès. Si aucune n'y arrive, on resserre le POC sur la seule combinaison JSON FQC × plan pour le temps restant. |
| Critère de succès | **JSON FQC × plan** : temps de remplissage ÷2, JSON valide, zéro FQC poussée sans relecture. **JSON FQC × note** : idem, champs adaptés (moins de géométrie, plus de texte). **MD générique × plan/note** : checklist correctement remplie, cohérente avec les mêmes critères que la version JSON, sans dépendance à AKRIBIA/Supabase. |
| Critère d'arrêt | Si aucune des 4 combinaisons ne tient son critère à l'échéance, le concept de vérification universelle (2 formats × 2 types) est invalidé : on ne garde que ce qui a marché, le reste repart en réserve. |
| Ressources | Licence Claude Pro déjà active ; schéma JSON FQC et export Supabase (AKRIBIA) ; modèle MD générique à créer (livrable du POC lui-même) ; documents de test à fournir par Jordan. |
| Suite si succès | JSON FQC intégré dans AKRIBIA ; modèle MD générique diffusé à l'équipe comme standard de vérification pré-diffusion, sans dépendance à un outil perso. |

## Suivi

| Date | Combinaison | Document testé | Temps manuel estimé | Temps avec IA | Erreurs / remarque |
|---|---|---|---|---|---|
| | | | | | |
