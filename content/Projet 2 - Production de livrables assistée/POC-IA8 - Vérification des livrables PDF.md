---
id: 20260807-1620
title: POC-IA8 - Vérification des livrables PDF
type: projet
domain: ia
status: stable
created: 2026-08-07
updated: 2026-09-03
tags:
  - projeteur
  - poc
  - akribia
  - checklist
summary: Fiche et suivi du POC qui teste si une IA peut lire les checks d'une fiche QC AKRIBIA comme liste de tâches, vérifier elle-même un PDF ou un fichier natif (IFC/DXF, RVT exclu), cocher les états et rédiger le commentaire IA. Premier test sur 8 plans PDF (canal de Briare), zéro erreur relevée par Jordan. Usage personnel de Jordan uniquement, sans lien avec la feuille de route commerciale d'AKRIBIA.
parent: "[[L'IA dans le métier de projeteur]]"
next: Tester sur un fichier natif (DXF/IFC) et sur un plan comportant des erreurs volontaires pour vérifier que l'IA détecte aussi les faux positifs ; optimiser la consommation de session Claude par document
echeance: 2026-09-08
revu: true
---

## Contexte et problématique

AKRIBIA est un outil développé sur temps personnel (voir [[Presentation generale]] dans `02_DOMAINES/HYDRA/AKRIBIA`), c'est un outil très intéressant et utile pour comprendre le contexte). Il permet de structurer le contrôle qualité d'un plan autour d'une fiche (l'indice / FQC) qui porte une liste de checks (catégorie, libellé, état à 4 valeurs `none/ok/nc/na`) et trois zones de commentaire, dont un champ `comment_ia` déjà présent en base mais non utilisé aujourd'hui. Dans l'usage actuel, l'utilisateur ouvre le document, vérifie chaque check à l'œil et coche à la main : c'est répétitif pour les points objectivement vérifiables depuis le document (cartouche, échelle, légende, nomenclature) et ça mobilise du temps identique à chaque révision d'un même plan.

Ce POC ne teste **que** l'idée suivante : une IA peut-elle prendre la liste des checks d'une fiche comme instructions, aller lire elle-même le document associé (PDF ou fichier natif BIM/CAO), et produire un premier passage exploitable (état par check + commentaire de synthèse) que l'utilisateur n'a plus qu'à valider plutôt que produire de zéro ?

## Objectif(s) / hypothèses à tester

À partir de la seule liste des checks d'une fiche QC (catégorie + libellé, sans autre instruction) et du document associé, une IA peut-elle :
1. Déterminer un état correct (`ok`/`nc`/`na`) pour chaque check objectivement vérifiable depuis le document, avec un taux d'accord élevé face à une correction humaine de référence.
2. Rédiger un commentaire de synthèse directement exploitable dans le champ `comment_ia`, sans reformulation nécessaire de la part de l'utilisateur.
3. Faire ce travail sur un PDF (cas favorable, lecture native) et, dans un second temps, sur un fichier natif ouvert (IFC, DXF).

## Périmètre

Comparaison systématique de la sortie IA (états + commentaire) à une correction de référence établie à l'avance par l'utilisateur.

Deux méthodes :

### 1. Claude code + Claude in Chrome
Utilisation de Claude Code pour lui faire lire le livrable (PDF/IFC/DXF), puis utilisation de Claude in Chrome pour aller naviguer dans l'interface d'AKRIBIA pour aller remplir les FQC et écrire le commentaire.

### 2. Claude Desktop
- 1 à 2 checklists réelles extraites au format PDF/JSON d'AKRIBIA (modèles "Plan 2D" et/ou "Maquette IFC" : catégorie + libellé de chaque check), utilisées telles quelles comme liste de tâches donnée à l'IA.
- Des documents de test personnels et non sensibles : au moins un PDF de plan, et si possible un export DXF ou IFC.
- Test manuel dans une conversation Claude (upload direct du document + de la checklist), sans aucune intégration dans AKRIBIA.

### Exclus
- L'intégration technique dans AKRIBIA (bouton dédié, appel API depuis `app.js`, écriture directe dans `checks`/`comment_ia` via Supabase) : projet séparé, conditionné au résultat de ce POC. Sous réserve d'acceptation de l'utilisation de l'outil.
- Les fichiers Revit natifs (`.rvt`) : format propriétaire binaire, illisible par une IA généraliste sans pipeline d'export dédié (IFC ou PDF en amont). Seuls les exports de ces fichiers entrent dans le périmètre.
- Tout ce qui relève de la feuille de route produit d'AKRIBIA (multi-tenant, preuve documentaire, module visa MOE, commercialisation) : hors sujet ici.

## Critères de succès mesurable

- Sur le PDF de test, taux d'accord entre l'état posé par l'IA et la correction de référence ≥ 80 % sur les checks objectivement vérifiables depuis le document (les checks purement déclaratifs, non visibles dans le fichier, sont exclus du calcul).
- Le commentaire IA est jugé exploitable tel quel par Jordan (sans reformulation) sur au moins la moitié des essais.
- Zéro cas où l'IA affirme un état `ok` sur un point qu'elle n'a pas réellement les moyens de vérifier dans le document (hallucination) : un seul cas de ce type invalide la confiance dans le dispositif, quel que soit le taux d'accord global.

## Critères d'arrêt

Si, sur le PDF (cas le plus favorable, lecture native par Claude), le taux d'accord reste bas ou que l'IA invente des constats absents du document, le concept n'est pas assez fiable pour aider au contrôle qualité : un faux "conforme" est pire qu'une case restée vide. On arrête et le sujet retourne en réserve, en attendant un dispositif à contraintes plus strictes (sortie forcée par schéma, function calling) plutôt qu'un simple prompt.

Si aucun format natif (DXF/IFC) n'est exploitable sans conversion préalable en PDF/image, le scope se restreint définitivement à "tout ce qui est exportable en PDF/image", sans chercher de parseur DWG/RVT natif.

## Boucle de validation humaine

L'utilisateur corrige à l'avance chaque fiche de test (état attendu par check) avant de lancer l'IA, pour disposer d'une référence indépendante. Après chaque essai, il compare la réponse IA à sa propre correction et note la nature des écarts (case ratée, case fausse, commentaire hors sujet). 

## Méthodologie / approche technique

1. Extraire une à deux checklists représentatives d'AKRIBIA (labels + catégories des checks d'un modèle existant), les mettre en forme comme liste de tâches.
2. Réunir 2 à 3 documents de test non sensibles : un PDF de plan en priorité, puis un DXF ou IFC exporté.
3. Pour chaque document, soumettre à Claude la checklist + le fichier, avec un prompt qui demande explicitement un état par check (`ok`/`nc`/`na`) et un commentaire de synthèse, dans un format proche de la fiche réelle (catégorie / libellé / état / commentaire). Consigne anti-hallucination explicite : répondre `na` plutôt qu'inventer un état si le document ne permet pas de trancher.
4. Pour les formats natifs (DXF/IFC), tester d'abord la lecture brute du fichier par Claude ; en repli, tester une conversion préalable en PDF ou image.
5. Comparer chaque sortie à la correction de référence, ajuster le prompt si le premier essai est décevant.

## Ressources nécessaires

Licence Claude déjà active. Extraction manuelle des checklists réelles d'AKRIBIA (via l'app ou l'export JSON). Documents de test personnels non sensibles. Aucun développement, aucun accès à la base Supabase de production.

## Planning

POC léger, une semaine : du 3 au 8 septembre 2026, calé sur la présentation du 8/09.

## Livrables attendus

Un verdict argumenté sur la faisabilité (fiabilité de l'IA à cocher des checks et rédiger `comment_ia` à partir d'un document réel), un prompt-type réutilisable si le résultat est positif, et la liste des formats qui posent problème (RVT natif au minimum, DWG/DXF à confirmer).

## Risques et limites connues

- Hallucination : l'IA peut affirmer un état `ok` sans l'avoir réellement vérifié dans le document, ce qui est plus dangereux qu'une case vide (faux sentiment de sécurité).
- Formats natifs fermés (RVT) illisibles sans pipeline d'export dédié : le POC ne prouve la faisabilité que pour ce qui est lisible tel quel ou après conversion simple.
- Le POC ne teste pas l'intégration technique dans AKRIBIA (coût par vérification, latence, appel API) : uniquement "l'IA peut-elle donner une réponse correcte", pas "comment le brancher en prod".
- Échantillon de test réduit (quelques documents personnels) : un bon résultat ne prouve pas la généralisation à tous types de plans ou de projets.

## Suivi

Une ligne par document / checklist testé.

| Date       | Checklist testée            | Document testé (type) | Taux d'accord IA / référence                     | Remarque                                                                                                                                                                                                                                                                                                                                                                                                             |
| ---------- | --------------------------- | --------------------- | ------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 2026-09-03 | Plans PRO (canal de Briare) | PDF x8                | 100 % (zéro erreur relevée par Jordan sur les 8) | Excel de sortie parfait. L'IA a identifié les bons problèmes et pièges dans les plans, posé `na` et justifié son choix dès qu'elle ne pouvait pas trancher. A remarqué des détails que Jordan lui-même n'avait pas vus pendant sa propre vérification. Environ 30 % d'une session Claude consommés pour les 8 plans (acceptable pour le volume, mais à optimiser). Test PDF uniquement, pas encore de fichier natif. |

## Conclusion / recommandation

Premier essai très positif (03/09/2026) : 8 plans PRO du canal de Briare passés en PDF, sortie Excel exploitable telle quelle, zéro erreur relevée par Jordan sur l'ensemble. L'IA a identifié les bons problèmes et pièges dans les plans, utilisé `na` avec justification quand elle ne pouvait pas trancher (aucune hallucination constatée), et repéré des détails que je n'avais pas vus. Les trois critères de succès sont dépassés sur ce premier lot. Point à surveiller : consommation de contexte (environ 30 % d'une session par lot de 8 PDF), correcte pour ce volume mais à optimiser avant d'envisager un usage répété.

Reste à tester : les formats natifs (DXF/IFC), et un cas volontairement fautif pour confirmer que l'absence d'erreur ne vient pas d'un test trop favorable.

### Suite si succès

Si le taux d'accord est suffisant, envisager une intégration technique dans AKRIBIA (bouton dédié, appel API, écriture dans `comment_ia` et `checks`), en gardant la validation humaine (viseur) comme étape obligatoire avant tout visa. Ce raisonnement reste distinct de la feuille de route commerciale du produit : ce POC valide un usage personnel, pas une fonctionnalité vendue.

## Prompt utilisé

```
Rôle : tu es un assistant de contrôle qualité (QC) pour des plans BIM / maritime, dans le cadre d'une vérification avant diffusion. Tu appliques une checklist existante à un document. Tu ne connais rien du projet en dehors de ce qui est donné ici. Documents fournis :

1. [Modèle de conformités] : la checklist de référence, une liste de checks organisée par catégorie, chaque check ayant un libellé.
2. [Plans à vérifier] : les PDF sur lesquels appliquer cette checklist. Tâche : pour CHAQUE check du modèle de conformités, dans l'ordre où il apparaît :
3. Cherche dans le plan PDF si ce que demande le check est présent et correct.
4. Attribue un état parmi exactement trois valeurs : ok (conforme), nc (non conforme), na (non applicable ou non vérifiable depuis ce document).
5. Justifie à la fin, en citant ce que tu as concrètement vu (ou pas vu) dans le document — jamais une justification générique du type "semble correct". Règle impérative (anti-hallucination) : si tu ne peux pas vérifier un point avec certitude à partir du document fourni (info absente, illisible, hors cadre du plan), réponds na et dis-le explicitement. N'invente jamais une conformité que tu n'as pas visuellement confirmée. Un "ok" injustifié est une erreur plus grave qu'un na. Format de sortie :
6. Un tableau excel, une ligne par check, une colonne par plan : | Catégorie | Libellé | État |
7. Une section "Commentaire IA" : un paragraphe de synthèse (5 à 8 lignes maximum), qui résume les points bloquants (nc), les points non vérifiables (na) et une appréciation générale — rédigé comme un commentaire prêt à être collé tel quel dans une fiche de contrôle qualité, sans reformulation nécessaire de ma part.
8. Une ligne "Niveau de confiance" : signale toute difficulté de lecture du PDF (résolution, texte trop petit, plan tourné, page manquante, etc.) qui aurait pu affecter la fiabilité de ta relecture. Deux points d'usage pour que le test soit comparable à ta grille de suivi :

- Attache le modèle de conformités en premier, puis le plan dans le même message : ça évite toute ambiguïté sur quel PDF fait office de checklist.
- Fais ta propre correction de référence avant d'envoyer le prompt : sinon le taux d'accord que tu notes dans le tableau de suivi n'a pas de valeur.
```