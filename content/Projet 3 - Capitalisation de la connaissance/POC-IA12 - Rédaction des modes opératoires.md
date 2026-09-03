---
id: 20260811-1654
title: POC-IA12 - Rédaction des modes opératoires
type: projet
domain: ia
status: stable
created: 2026-08-11
updated: 2026-09-03
tags:
  - projeteur
  - poc
  - hydra-flow
  - mop
summary: Fiche et suivi du POC-IA12, développement d'un éditeur autonome de modes opératoires normalisés, gouvernance as code mené avec Claude Code sans écriture de code à la main. Démarré le 21 juillet 2026, en v0.3 (opérationnel) au 11 août 2026, jamais testé par un autre projeteur.
parent: "[[L'IA dans le métier de projeteur]]"
next: Faire rédiger un MOP réel par un projeteur autre que Jordan dans dist/editeur.html, sans aide, et confronter le résultat au critère de succès.
echeance: 2026-09-08
revu: true
---
## Contexte et problématique

Les modes opératoires, ou tutoriels logiciels (AutoCAD, Revit, Allplan, Covadis, Civil 3D, QGIS) existent aujourd'hui de façon éparse, sans rendu homogène ni gouvernance vérifiable. Les rédiger suppose de manier du Markdown et du YAML techniques, hors de portée des dessinateurs-projeteurs qui devraient être les premiers à les écrire (invariant du projet : « le projeteur ne voit jamais de code »). Ce POC teste si un outil développé de bout en bout par l'IA (Claude Code), peut combler ce besoin.

## Objectif(s) / hypothèses à tester

Un dessinateur-projeteur sans compétence de développeur peut-il faire concevoir, coder et maintenir par l'IA un outil de production interne réel, au point qu'un projeteur autre que l'auteur rédige un vrai MOP dedans, sans formation ni aide ?

## Périmètre

Inclus : le développement de l'éditeur (format `.md` à frontmatter, éditeur autonome `dist/editeur.html`, gouvernance-as-code contrôlant la charte CHA-DOC-001, export PDF, snippet Obsidian) et sa prise en main par au moins un projeteur autre que Jordan sur un MOP réel.

Exclu : la qualité rédactionnelle des MOP eux-mêmes (ce POC ne la mesure pas).

## Critères de succès mesurable

- Un projeteur rédige un MOP réel dans `dist/editeur.html`, sans formation ni aide.
- Temps de rédaction comparable ou inférieur à une rédaction Word.
- Export PDF conforme à la charte CHA-DOC-001.

## Critères d'arrêt

La friction d'usage (éditeur, panneau de gouvernance, dépôt du `.zip` dans le coffre) décourage l'adoption après deux ou trois essais accompagnés, ou une limite technique bloque un navigateur imposé par la DSI.

## Boucle de validation humaine

Relecture de chaque évolution livrée par Claude Code avant de la considérer acquise : les 3 lois testées automatiquement (idempotence, canonicité, fidélité du rendu, `npm test`), la gouvernance-as-code qui bloque le build si un MOP `valide` viole la charte. Aucun MOP n'est publiable en `valide` sans passer ce contrôle. Il manque en revanche la relecture par un tiers projeteur, ce que ce POC doit précisément déclencher.

## Méthodologie / approche technique

Développement conversationnel avec Claude Code depuis le 21 juillet 2026, `CLAUDE.md` du projet servant de contrat tenu à jour (invariants, architecture, journal des décisions techniques). Trois versions livrées en trois semaines : v0.1 (plateforme JSON, site statique), v0.2 (passage au `.md` et au coffre Obsidian, suppression du site), v0.3 (paquet `.zip` en remplacement du base64 dans le `.md`). Chaque évolution verrouillée par des tests automatiques (65 tests au total).
Ensuite, possibilité de stocker les fichiers `.md` dans le coffre DATA_BRLI pour possibilité de lecture par l'outil associé (voir [[POC-IA10 - Assistant interne type RAG sur les conventions BIM, normes, retours d'expérience projets]])
## Ressources nécessaires

Licence Claude Pro déjà active. Aucune ressource supplémentaire identifiée à ce stade. Pour la phase de test terrain : un projeteur volontaire et un MOP réel à rédiger.

## Planning

Développement démarré le 21 juillet 2026, statut « opérationnel » atteint le 11 août 2026 (3 semaines, v0.3). Test terrain avec un projeteur tiers visé avant le 8 septembre 2026 (présentation d'équipe).

## Livrables attendus

Un outil utilisable en production par un rédacteur autre que Jordan, un premier MOP réel produit par ce tiers, et un bilan qualitatif (temps, friction rencontrée, décision d'adoption) pour nourrir la présentation direction.

## Risques et limites connues

- La vérification manuelle de bout en bout (double-clic, hors ligne, Chrome et Safari, collage Word) n'a pas encore été faite (cf. `CLAUDE.md` du projet, section « Reste à vérifier à la main »).
- Le dépôt d'un `.zip` reçu dans le coffre reste manuel : pas de script Node symétrique à `ingest` pour l'instant.
- Le régime de développement (temps BRL ou personnel) n'est précisé nulle part dans le projet, contrairement à HYDRA-TOPOS qui l'affiche explicitement. Point à clarifier avant toute présentation à la direction, pour ne pas donner l'impression d'un outil présenté après coup plutôt que d'un vrai POC piloté.
- Ce POC ne prouve que la faisabilité de l'outil, pas la qualité rédactionnelle des MOP qui y seront produits.

## Suivi

Une ligne par test avec un rédacteur.

| Date | MOP | Temps manuel estimé | Temps avec IA | Remarque |
| ---- | --- | ------------------- | ------------- | -------- |
|      |     |                     |               |          |

## Conclusion / recommandation

POC en cours (développement démarré le 21 juillet 2026, formalisé sous ce numéro le 11 août 2026). Aucun verdict possible tant qu'aucun projeteur autre que Jordan n'a testé l'outil sur un MOP réel : c'est la seule chose qui manque pour juger le critère de succès.

### Suite si succès

Diffusion à l'équipe comme standard de rédaction des MOP. Le script de dépôt automatique du `.zip` reçu dans le coffre (aujourd'hui manuel) devient alors prioritaire.
