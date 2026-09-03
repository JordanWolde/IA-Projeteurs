---
id: 20260809-1513
title: AKRIBIA - Présentation générale
type: projet
domain: bim
status: stable
created: 2026-08-09
updated: 2026-09-03
stack:
  - javascript
  - supabase
  - postgres
next:
tags:
  - qc
  - codification
  - checklist
  - saas
summary: Application web de contrôle qualité (QC) pour plans BIM/maritime, modèle Projet/Phase/Plan/Indice/Check, codification par segments, checklists réutilisables. Passée le 09/08/2026 d'outil personnel à produit destiné à la commercialisation.
revu: true
---
# AKRIBIA : Note de présentation générale

*Dernière mise à jour : 10/08/2026*

> **Renommage acté le 10/08/2026 : HYDRA VISA devient AKRIBIA.** Motif : "VISA" entre en collision avec la marque mondialement protégée de Visa Inc., un obstacle rédhibitoire au dépôt de marque (refus INPI ou opposition), pas un risque de procès dans ce secteur. AKRIBIA (du grec ἀκρίβεια, la rigueur d'une vérification) garde la parenté grecque avec le préfixe HYDRA, est prononçable au téléphone et non-descriptif du logiciel donc déposable. Le mot "visa" reste utilisé normalement dans le vocabulaire métier de l'app (viser un plan) : seul le nom commercial change. Détail dans [[Cadre juridique]] §8.
>
> **Changement de nature acté le 09/08/2026.** AKRIBIA n'est plus un outil personnel : l'objectif est sa commercialisation auprès de bureaux d'études. Voir §5, et les notes filles pour le détail (offres, marketing, juridique, feuille de route).

## 1. Objectif du projet

**AKRIBIA** (anciennement HYDRA VISA, renommé le 10/08/2026) est une application web de gestion de **contrôle qualité (QC)** pour des projets BIM / maritime / construction. Elle est développée par Jordan (dessinateur projeteur) pour outiller le processus de vérification des plans avant diffusion.

Le nom d'origine "HYDRA VISA" faisait référence au **visa** : le tampon d'approbation formel ("bon pour exécution") apposé sur un plan validé. L'application digitalise ce processus : chaque révision de plan (indice) passe par une fiche de contrôle qualité structurée avant d'obtenir son visa. Cette logique métier ne change pas avec le renommage, seul le nom commercial change.

### Problème adressé
Dans un projet BIM/construction, chaque plan produit (2D, maquette IFC, etc.) doit être vérifié selon une checklist qualité avant diffusion : conformité documentaire, géométrie, respect de la charte BIM, etc. Sans outil dédié, ce suivi se fait sur tableur ou papier, avec un risque de perte de traçabilité entre les révisions successives d'un même plan. AKRIBIA centralise cette traçabilité : un plan → ses indices (révisions) → pour chaque indice, une fiche QC avec l'historique des contrôles.

## 2. Composition fonctionnelle

### Modèle de données
```
Project (codification) → Phase (codes par défaut, séries) → [Série] → Plan (code, liens) → Indice (révision FQC) → Check
```

- **Projet** : nom + structure de codification du numéro de plan (`codif`), propre à chaque projet.
- **Phase** : regroupement de plans (ex. phase EXE, phase AVP), avec des codes hérités par défaut et des séries internes.
- **Série** : sous-regroupement optionnel de plans au sein d'une phase (organisable par glisser-déposer).
- **Plan** : fiche identité du document — code (9 segments codifiables), titre, échelle, dessinateur/vérificateur/approbateur, liens externes.
- **Indice** : une révision du plan = une **Fiche de Contrôle Qualité (FQC)** complète, avec ses commentaires (dessinateur, IA, vérificateur) et sa liste de checks.
- **Check** : item de contrôle individuel, avec un état à 4 valeurs (`none` / `ok` / `nc` / `na`).

### Codification des plans
Chaque projet définit sa propre structure de numérotation de plan via 9 segments par défaut (projet, origine, volume, niveau, type, discipline, numéro, statut, révision). Un éditeur dédié permet, par projet, de réordonner, masquer, renommer, limiter la longueur et rendre obligatoire chaque segment. Le segment "révision" n'est jamais saisi à la main : il est automatiquement dérivé du dernier indice FQC du plan.

### Contrôle qualité (QC)
- Chaque check a un cycle d'état simple : vide → conforme (OK) → non-conforme (NC) → non applicable (NA).
- Le score de conformité d'une fiche exclut les checks "NA" du calcul, mais compte les checks encore vides ("none") contre le 100% tant qu'ils ne sont pas traités, ceci pour empêcher un score artificiellement haut sur une fiche incomplète.
- Des **modèles de checklist** réutilisables sont fournis en standard (Fiche QC complète, Plan 2D, Maquette IFC) et l'utilisateur peut créer les siens.
- Un modèle de **codification** peut également être sauvegardé et réappliqué à d'autres projets.

### Organisation et confort d'usage
- Navigation par arborescence Projet → Phase → Série → Plan → Indice, avec sidebar redimensionnable et rétractable.
- Favoris épinglés, projets récents, tri par nom/numéro/date.
- Mode sombre et couleur d'accent personnalisable (bleu `#0098D8` par défaut depuis le 10/08/2026, voir [[Marketing et positionnement]] §8).
- Export PDF propre de la fiche QC (sans en-têtes/pieds de page navigateur), horodaté.
- Export/import d'une sauvegarde complète au format JSON.

### Fonctionnalité différée (non développée)
Un module **visa d'ingénierie** est identifié pour une évolution future : réception des documents MOE (Maîtrise d'Œuvre), gestion des statuts VSO/VAO/refusé, traçabilité des indices côté ingénierie. Il ne sera développé que sur demande explicite de Jordan.

## 3. Aperçu rapide de l'infrastructure web

*(Le détail complet fait l'objet d'une note séparée : voir `Infrastructure-web.md`)*

- **Frontend pur**, sans framework ni étape de build : HTML/CSS/JS natifs, répartis en 3 fichiers (`index.html`, `app.css`, `app.js`) pour permettre une politique de sécurité de contenu (CSP) stricte.
- **Backend** : Supabase (PostgreSQL managé + authentification + row-level security), avec un mode local de secours (démo sans compte, stockage dans le navigateur).
- **Hébergement statique** : les fichiers sont servis tels quels, sans serveur applicatif — seul Supabase joue le rôle de backend distant.
- **Aucune dépendance de build** : une seule librairie externe chargée par CDN (`@supabase/supabase-js`), avec vérification d'intégrité (SRI) et version épinglée.
- **Sécurité des données** : chaque table est cloisonnée par utilisateur au niveau base de données (RLS Postgres), pas seulement côté application.

## 4. Conventions de conception notables

- Interface entièrement en français, vouvoiement systématique.
- Aucune scrollbar dans l'interface : tout le layout est pensé pour tenir en flex/compact.
- La fonction "annuler" (Ctrl+Z) est explicitement exclue du périmètre : jugée trop complexe à garantir de façon fiable avec la synchronisation Supabase en arrière-plan.
- Toute évolution doit être non régressive : les fonctionnalités existantes sont considérées stables et ne doivent pas être cassées par une correction ciblée.

## 5. Passage en produit commercial (09/08/2026)

### Ce qui est décidé

- **Objectif** : vendre AKRIBIA en SaaS par abonnement, avec une offre self-hosted en licence annuelle dans un second temps.
- **Cible 1** : l'équipe de bureau d'études, représentée par un ingénieur, un chef de projet ou un responsable BIM. **Cible 2, différée** : le projeteur indépendant ou freelance.
- **Frontière produit** : l'application n'héberge pas les documents et ne deviendra jamais un CDE. Elle héberge leur historique de contrôle et pointe vers le fichier là où il est stocké. C'est cette frontière qui supprime la migration, la validation DSI et la concurrence frontale avec les plateformes en place.
- **Modèle** : Solo facturé au siège (1 utilisateur, 29,90 €/mois), Projet facturé au projet (199,90 €/mois, utilisateurs illimités, compte gratuit). Voir [[Offres et tarification]].

### État réel du projet

Aucun utilisateur externe n'a ouvert l'application à ce jour. Toutes les hypothèses de valeur, de prix et de fonctionnalités reposent sur l'usage d'une seule personne, l'auteur. La prochaine étape déterminante n'est pas technique.

### Deux préalables bloquants

1. **La propriété du code.** Les cadres généraux (essaimage, congé pour création d'entreprise, précédent nginx) sont dans [[L'essaimage et les créations du salarié]], l'application au cas AKRIBIA dans [[Cadre juridique]].
2. **Un utilisateur externe observé** sur un projet réel, sans assistance.

### Notes filles

- [[Infrastructure web]] : détail technique de l'existant.
- [[Offres et tarification]] : grille tarifaire, marché concurrent, arbitrage du modèle de facturation.
- [[Marketing et positionnement]] : positionnement, cibles, texte de la page d'accueil, angle ISO 9001, plan d'amorçage.
- [[Cadre juridique]] : propriété du code, mentions légales, RGPD, CGV, assurance, marque.
- [[Feuille de route produit]] : étapes manquantes, multi-tenant, tests d'isolation, ordre d'exécution.
- [[Prompt session code]] : prompt de réalignement pour la session Claude Code du dépôt.
