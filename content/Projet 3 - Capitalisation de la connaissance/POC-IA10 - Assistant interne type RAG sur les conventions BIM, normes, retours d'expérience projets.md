---
id: 20260824-1615
title: POC - Assistant interne type RAG sur les conventions BIM, normes, retours d'expérience projets
type: projet
domain: ia
status: stable
created: 2026-08-24
updated: 2026-09-03
tags:
  - projeteur
  - poc
  - rag
  - data-brli
summary: Cadrage du POC-IA10, assistant interne type RAG sur le corpus DATA_BRLI (charte BIM BRL, tutos, fiches d'aide, retours d'expérience), avec repli sur une recherche web sourcée et validée quand le corpus ne répond pas. Hypothèse et critères de succès définis, expérimentation pas encore démarrée.
parent: "[[L'IA dans le métier de projeteur]]"
next: Construire l'échantillon de questions test et lancer la boucle complète (recherche interne, repli web sourcé, validation, écriture) sur DATA_BRLI.
echeance:
revu: true
---
## Contexte et problématique

**RAG = Retrieval-Augmented Generation** (« génération augmentée par la recherche »).

L'idée : un modèle de langage comme ChatGPT ou Claude ne connaît pas nos documents internes (procédures, contrats, comptes rendus, base clients…). Le RAG comble ce trou. Plutôt que de réentraîner un modèle (long et coûteux) on va **chercher les bons passages dans vos documents au moment de la question**, et on les glisse dans le prompt pour que le modèle réponde à partir de ça

Le corpus visé est `DATA_BRLI` (`00_BIBLIO_BRLI/00_COMMUN/05_DATA_BRLI`) : charte BIM BRL, tutoriels et fiches d'aide par logiciel (`10_PROCEDURES`, `00_INCIDENTS`), retours d'expérience sur projets (`40_PROJETS`). Cette connaissance existe mais reste dispersée entre plusieurs dossiers et logiciels, et deux volets (charte, retours d'expérience) sont encore vides dans le coffre à ce jour. Retrouver une règle précise ou un retour d'expérience demande aujourd'hui une recherche manuelle dans ces dossiers. Ce POC teste si un assistant interrogeable en langage naturel, appuyé sur ce corpus (RAG, génération augmentée par la recherche), peut remplacer une partie de cette recherche manuelle avec des réponses sourcées et vérifiables.

Concrètement, quand on pose une question à l'assistant :

1. **Indexation** (fait en amont, une fois) : vos documents sont découpés en morceaux et convertis en vecteurs numériques stockés dans une base vectorielle.
2. **Recherche** : la question est convertie de la même façon, et le système récupère les 3 à 10 extraits les plus proches sémantiquement.
3. **Augmentation** : ces extraits sont ajoutés à la question, avec une consigne du type « réponds uniquement à partir de ces éléments ».
4. **Génération** : le modèle rédige la réponse, en citant idéalement ses sources.

Les deux gros avantages : les réponses sont ancrées dans vos données (moins d'hallucinations, sources vérifiables), et mettre à jour la connaissance revient juste à remplacer un document dans l'index. Le point de vigilance principal, c'est la qualité de la recherche : si l'étape 2 remonte les mauvais extraits, la réponse sera fausse même avec un excellent modèle.

## Objectif(s) / hypothèses à tester

Un projeteur qui n'a pas participé à la conception de l'assistant peut-il obtenir une réponse fiable à une question sur la charte BIM BRL, un tuto logiciel ou un retour d'expérience de projet, que la réponse vienne du corpus interne `DATA_BRLI` ou, à défaut, d'une recherche internet clairement sourcée, avec ensuite une écriture validée dans `90_BROUILLONS` qui comble le manque pour la prochaine fois ?

## Périmètre

Inclus : le corpus `DATA_BRLI`, en particulier `10_PROCEDURES` et `00_INCIDENTS` (tutos et fiches d'aide par logiciel, déjà alimentés), `20_NORMES` et `40_PROJETS` au fur et à mesure qu'ils se peuplent, et la boucle complète de la question à la capitalisation : recherche dans le corpus interne d'abord, recherche internet sourcée en repli si le corpus ne répond pas, validation par l'utilisateur, puis écriture dans `90_BROUILLONS`, relecture et classement dans le bon dossier.

Exclu : tout déploiement multi-utilisateurs, toute donnée de projet sensible envoyée à un moteur de recherche web public, et tout classement automatique sans la relecture humaine déjà imposée par le circuit `DATA_BRLI` (Claude n'écrit jamais directement dans `00_INCIDENTS`, `10_PROCEDURES`, `20_NORMES` ou `40_PROJETS`).

## Critères de succès mesurable

- Sur un échantillon d'une quinzaine de questions réelles, taux de réponses correctes et correctement sourcées supérieur à 80 %.
- Temps de réponse de l'assistant inférieur au temps de recherche manuelle constaté sur les mêmes questions dans `DATA_BRLI`.
- Aucune hallucination non détectée sur l'échantillon de test (chaque réponse vérifiée contre sa source).
- Quand la réponse ne vient pas du corpus interne, l'assistant le signale explicitement et cite ses sources web avant toute proposition d'écriture.
- Aucune écriture dans `90_BROUILLONS` sans validation explicite de la réponse par l'utilisateur au préalable.

## Critères d'arrêt

Le taux d'erreur ou d'hallucination reste élevé malgré plusieurs itérations sur le découpage et l'indexation du corpus, ou l'assistant écrit dans `90_BROUILLONS` sans validation préalable (rupture du circuit de sécurité de `DATA_BRLI`), ou aucune solution accessible ne respecte la contrainte de sécurité des données.

## Boucle de validation humaine

Deux validations distinctes avant qu'une réponse externe n'entre dans le corpus : d'abord sur la réponse elle-même (l'utilisateur confirme qu'elle est correcte et mérite d'être capitalisée) avant de déclencher l'écriture dans `90_BROUILLONS`, puis la relecture classique du circuit `DATA_BRLI` avant déplacement dans le dossier définitif et commit. Aucune réponse, interne ou externe, ne fait foi sans source vérifiable et consultable.

## Méthodologie / approche technique

Interroger d'abord le corpus `DATA_BRLI` (RAG). Si le corpus ne donne pas de réponse fiable, basculer sur une recherche internet avec citation systématique des sources. Soumettre cette réponse externe à la validation de l'utilisateur avant de déclencher l'écriture dans `90_BROUILLONS`, puis suivre le circuit déjà en place dans `DATA_BRLI` (relecture, déplacement dans le bon dossier, commit), déjà utilisé pour `00_INCIDENTS` et `10_PROCEDURES`. Comparer les réponses obtenues à une base de référence sans RAG (même question posée à l'assistant sans accès au corpus).

## Ressources nécessaires

Licence Claude Pro déjà active. Accès à une recherche web pour le repli hors corpus. `20_NORMES` et `40_PROJETS`, aujourd'hui vides dans `DATA_BRLI`, se peuplent via la boucle testée elle-même plutôt que par un peuplement manuel préalable. Pas de budget supplémentaire identifié pour cette phase pilote.

## Planning

POC pas encore démarré. Rattaché à la phase 1 (cadrer et prouver) du projet parent, courant d'août à décembre 2026. Le peuplement de `20_NORMES` et `40_PROJETS` se fait pendant le test (boucle repli web + validation + écriture), pas en préalable.

## Livrables attendus

Un rapport court avec le taux de réponses correctes mesuré sur l'échantillon de test (interne et repli web), le nombre de fiches effectivement écrites et validées dans `DATA_BRLI`, et une démonstration de l'assistant sur quelques questions réelles.

## Risques et limites connues

- `20_NORMES` et `40_PROJETS` sont aujourd'hui vides dans `DATA_BRLI` : tant qu'ils ne sont pas alimentés, une bonne partie de l'échantillon de test tombera nécessairement sur le repli web plutôt que sur le corpus interne.
- Le repli sur une recherche web introduit un risque de fuite de donnée si une question de l'échantillon contient une information de projet sensible : à cadrer avant de lancer les tests (formulation des questions, pas de nom de projet réel dans une requête envoyée au web).
- `DATA_BRLI` sert aussi de support à un autre usage (diagnostic et dépannage logiciel, via son propre Claude Code) : à ne pas confondre avec ce POC, qui vise la capitalisation de connaissance côté charte, normes et REX plutôt que le support technique.
- Confidentialité : ne pas indexer de donnée de projet sensible dans un outil cloud public une fois le corpus étendu aux retours d'expérience de projets réels.
- Est-ce que l'assistant sera toujours aussi efficace avec une base de donnée conséquente ?
- Recouvrement avec le POC-IA10 (recherche sémantique archives).

## Suivi

Une ligne par question testée.

| Date | Question testée | Temps manuel estimé | Temps avec IA | Remarque |
| ---- | ---------------- | -------------------- | -------------- | -------- |
|      |                   |                       |                |          |

## Conclusion / recommandation

POC cadré mais pas encore démarré : aucune expérimentation lancée à ce stade, donc aucun verdict possible. Prochaine étape : construire l'échantillon de questions test et lancer la boucle complète (recherche interne, repli web sourcé, validation, écriture) sur `DATA_BRLI`.

### Suite si succès

Si validé, l'assistant s'intègre à la phase 3 du projet parent (bibliothèque interne de requêtes et de scripts validés), et peut s'étendre une fois le POC-IA10 (recherche sémantique archives) posé.
