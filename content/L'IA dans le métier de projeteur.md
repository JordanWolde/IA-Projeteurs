---
id: 20260729-2012
title: L'IA dans le métier de projeteur
type: projet
domain: ia
status: stable
created: 2026-07-29
updated: 2026-09-03
tags:
  - projeteur
  - poc
  - referent-ia
summary: Projet de déploiement de l'IA dans l'équipe projeteur de BRL. Cadrage, POC d'août à décembre, deux présentations de rentrée, industrialisation à décider selon résultats mesurés.
next: Envoyer les fiches des trois POC au relais numérique et à la direction pour validation
echeance: 2026-09-08
revu: true
---
Projet de déploiement de l'IA dans l'équipe projeteur de BRLI. État des lieux honnête en **août 2026** de ce qui est réellement utilisable dans notre environnement : AutoCAD, Covadis, Revit, Allplan, QGIS (+ Civil 3D, Lumion).

Voir [[Les outils IA]] pour plus de précision sur les outils envisagés et disponibles à ce stade.
## Hypothèses

Le projet repose sur des hypothèses non démontrées :

- **La plus importante : l'IA de demain fera toujours mieux que celle d'aujourd'hui.** Les verdicts de ce panorama sont une photo à un instant T, pas un jugement définitif : ce qui est immature aujourd'hui (mise en page automatique, Text-to-BIM) peut devenir utilisable d'ici quelques mois.
- **L'IA coûtera de moins en moins cher.** Accès local, augmentation de la cadence de tokens, concurrence entre éditeurs : le coût d'accès devrait continuer de baisser, ce qui change le calcul de rentabilité des cas d'usage jugés aujourd'hui trop chers ou pas assez mûrs pour l'investissement (comme les postes en local par exemple).

## Où on en est

Présentation faite le 29/07/2026 à Julien Helj, sur la base d'une note de veille et d'un plan d'attaque. Décision prise à l'issue de cet échange : proposer des POC courant août à la direction et au relais numérique, puis tester en pratique de septembre à décembre pour trancher ce qui s'industrialise.

Licence Claude Pro côté pro activée le 29/07/2026. Le pilote phase 1 (moins de 500 € HT engagés) peut démarrer sans attendre.

## Deux présentations en septembre

- **8 septembre** : présentation aux relais numériques, à titre d'info (format réunion d'équipe, 5-10 min), avec démo des projets/POC en cours.
- **Présentation plus officielle à la direction** : certainement plus tard (date à préciser). Portée différente : arbitrages, budget, temps alloué, sponsor.

## Ce que l'on attend de l'IA en tant que projeteurs

L'idée était de réaliser un tour de table des besoins des différents projeteurs. De ceci en résulte une liste d'usages attendus clairement définis :

- Réduire voir supprimer les tâches répétitives à faible valeur ajoutée.
- Accélérer la production de livrables (mise en page automatique).
- Vérifier nos travaux plus efficacement.
- Correction de problèmes et support.
- Augmenter le bien-être par la facilitation de certaines tâches.
- Être plus réactif sur les urgences/imprévus.

Les différents POC se basent sur ces besoins.

## Objectifs de ce travail

- Vérifier la faisabilité de certains objectifs.
- Chiffrer les gains mesurés (temps, coût) pour arbitrer l'industrialisation.
- Sécuriser un cadre d'usage reproductible, indépendant d'une seule personne.
- Limiter les craintes et inconnues.

## Feuille de route

Le reste ci-dessous reste à dérouler.

**Phase 1 (mois 1 à 3) : cadrer et prouver.** Ouvrir 1 licence pro/max d'un assistant (arbitrage Claude / ChatGPT / Mistral selon le critère de souveraineté retenu, Claude de préférence). Cibler des cas d'usage mesurables et les valider/invalider.
Mesurer le temps gagné, la qualité, les incidents pour livrer bilan chiffré.

**Phase 2 (mois 3 à 6) : tester l'IA intégrée.** Passer à Revit 2027, AutoCAD 2027 et Allplan 2026. Activer et évaluer l'Autodesk Assistant à la migration 2027 et les briques IA d'Allplan 2026, déjà incluses. Tester en prod sur un projet non sensible. Expérimenter le serveur MCP de Revit 2027 sur maquettes de test.

**Phase 3 (mois 6 à 12) : industrialiser.** Étendre à ce qui a prouvé sa valeur, constituer une bibliothèque interne de requêtes types et de scripts validés. Étudier une solution souveraine ou locale (Mistral en interne, poste IA dédié) si un besoin sur données sensibles se confirme. Poursuivre la veille (revue semestrielle de ce panorama) et l'animation du sujet.

**Budget.**

Le principal budget pour mener à bien ce projet est le temps. En effet le temps de mise en place et de test de certaines idées n'est pas nul. Mais le gain est tellement conséquent qu'il est rattrapé en prod.
On peut estimer qu'un jour par mois est nécessaire pendant la phase 1 et 2. Puis deux à trois jour en phase d'industrialisation.
En phase d'utilisation/maintenance, la demande intervient au cas par cas mais 3-5 jours par an sont nécessaires si de nouvelles idées arrivent ou si la mise à jour de certains process doivent être effectuées.

Sinon en terme de budget matériel :

| Poste                                    | Coût indicatif HT | Remarque                                                      |
| ---------------------------------------- | ----------------- | ------------------------------------------------------------- |
| 1 licence assistant IA (phase 1, pilote) | 180 à 340 €/an    | Selon l'outil (15 à 28 €/mois)                                |
| IA intégrée Autodesk / Allplan           | 0 €               | Incluse dans les abonnements actuels                          |
| Plugins QGIS (SAM, GeoAI, Deepness)      | 0 €               | Open source                                                   |
| Option phase 3 : poste IA local          | 3 000 à 5 000 €   | Investissement unique, si besoin « données sensibles » validé |

**Budget phase 1 engagé : moins de 500 € HT.** Le reste s'active phase par phase, selon les résultats mesurés.

## Le corps du travail

**Projet = un axe métier avec un objectif "business".** Il porte une problématique (par ex : réduire le temps de production).

**POC = une expérimentation courte à l'intérieur.** Il teste **une** hypothèse précise, sur un périmètre réduit, avec un critère de succès chiffré et une date de fin. Un projet contient 2 à 5 POC qui s'enchaînent ou tournent en parallèle.

L'intérêt de ce découpage : ça transforme nos objectifs en une liste de paris limités, mesurables, et surtout **abandonnables sans casse**.
### Projet 1 - Assistance à la production BIM

- [[POC-IA1 - Génération de scripts]]
- [[POC-IA2 - Analyse CCTP]]
- POC-IA3 - Contrôle qualité automatisé de maquette (nommage, paramètres, conformité convention) (à venir)
- POC-IA4 : Aide au paramétrage de familles (selon convention BRL) (à venir)
- [[POC-IA5 - HYDRA-TOPOS]]
- POC-IA6 - Génération de fichier de dessin (dxf) à partir de data brute (à venir)
### Projet 2 - Production de livrables assistée

- [[POC-IA7 - Comptes rendus de réunion]]
- [[POC-IA8 - Vérification des livrables PDF]]
- POC-IA9 - Création d'agent d'automatisation de tâches répétitives (à venir)

### Projet 3 - Capitalisation de la connaissance

- [[POC-IA10 - Assistant interne type RAG sur les conventions BIM, normes, retours d'expérience projets]]
- POC-IA11 - Recherche sémantique dans les archives d'affaires (à venir)
  (Lien avec idée outil REX réunion d'équipe infra)
- [[POC-IA12 - Rédaction des modes opératoires]]

### Projet transverse - Cadre d'usage 

 - POC-IA13 - Charte d'usage IA (à venir)
 - POC-IA14 - Classification des données (à venir)
 - POC-IA15 - Quels outils pour quel niveau de confidentialité (à venir)

## Points ouverts

- **Sponsor côté direction** : qui porte officiellement le sujet en interne, pas encore identifié.
- **Temps alloué** : non négociable pour la suite, pour les phases suivantes de test et l'industrialisation (minimum 1 jour/mois).
- **Aides nécessaires** : à préciser une fois le sponsor identifié.
- **Reconnaissance du rôle référent IA** : charge non cadrée (formation de l'équipe, veille, pilotage des POC). A formaliser.

## Dimension humaine (gestion des différents profils dans l'équipe)

La réussite du projet dépend autant de l'adoption par l'équipe que du choix des outils. Trois profils coexistent chez les projeteurs : 
- des curieux prêts à tester tout de suite, 
- un socle qui attend des preuves concrètes avant de s'investir, 
- des réfractaires qui craignent d'être jugés moins bons ou remplacés par l'outil. 

Le rythme d'adoption ne peut pas être identique pour les trois. Les curieux servent de relais informels plutôt que de porte-parole imposé. L'obligation viendra plus tard si besoin du sponsor. Le socle hésitant se convainc par des gains chiffrés sur des cas réels, pas par un discours.

Les réfractaires demandent une approche à part : rien d'imposé avant que la confiance ne soit installée, du temps dédié traité comme un vrai coût (lié au point ouvert sur le temps alloué) et non comme une charge ajoutée au travail courant, et un droit à l'erreur explicite sur les premiers essais. 
**Constat de départ, indépendant de l'IA : certains projeteurs sont déjà moins efficaces que d'autres sur des tâches comparables.** 
L'IA amplifie cet écart plutôt qu'elle ne le corrige : les profils déjà rapides gagnent encore en vitesse en l'adoptant, les profils réfractaires ou en difficulté restent sur des méthodes 2D/3D pures et décrochent davantage. Le vrai risque à moyen terme n'est pas seulement l'adoption individuelle, c'est la formation de deux équipes dans l'équipe (2D/3D d'un côté, 2D/3D/IA de l'autre) avec un écart de productivité qui se creuse sans plan explicite pour le refermer.

## Ce qu'on peut en retenir

État réel au 3 septembre 2026, POC par POC (le panorama de juillet, qui tenait lieu de bilan provisoire, est maintenant remplacé par ces retours de terrain).

Deux POC ont un verdict chiffré, tous les deux dans l'assistance à la production BIM :

- **Génération de scripts (POC-IA1) : validée, gains réels en prod.** Quatre scripts capitalisés sur Dynamo/Python (Revit) et AutoLISP (AutoCAD/Covadis), de 4-8h à 34h économisées par projeteur et par an selon le script, fonctionnels dès le premier essai, tous utilisés en réel. Limite rencontrée : la Python API d'Allplan (PythonParts) a mis en échec le script 3DTOARCHI (l'IA évoque une limitation logicielle, sans certitude, sujet hors compétence pour trancher seul). L'usage est donc acquis sur Revit et AutoCAD/Covadis, encore incertain sur Allplan.
- **Analyse de CCTP (POC-IA2) : GO conditionnel.** Sur les deux CCTP testés, temps divisé par 10 à 15 (objectif visé : par 2) et détection de points bloquants que l'équipe avait déjà identifiés en études, plus d'autres qu'elle n'avait pas relevés. Le frein n'est pas la fiabilité mais le coût : une session Claude entière consommée pour une seule demande sur le test le plus dense. Condition avant toute généralisation : retravailler le skill pour réduire cette consommation.

Quatre POC n'ont encore aucun verdict, tous calés sur l'échéance du 8 septembre :

- **Comptes rendus de réunion (POC-IA7)** : un seul essai informel à ce stade, sans anonymisation ni mesure de temps. Rien à en tirer avant d'avoir fiabilisé l'anonymisation des intervenants et chronométré 2 à 3 réunions réelles.
- ==**Vérification des livrables PDF (POC-IA8, AKRIBIA)** : pas démarré. Reste à extraire une checklist réelle et à réunir des documents de test.==
- ==**Assistant interne type RAG sur DATA_BRLI (POC-IA10)** : cadré, pas démarré. Deux des quatre dossiers du corpus visé (`20_NORMES`, `40_PROJETS`) sont vides, ce qui va mécaniquement pousser une partie des tests vers le repli web plutôt que vers le corpus interne.==
- **Éditeur de modes opératoires (POC-IA12)** : outil en v0.3, opérationnel, développé de bout en bout par Claude Code sans écriture de code par le projeteur. Mais jamais testé par quelqu'un d'autre : c'est la seule chose qui manque pour juger le vrai critère de succès (adoption par un tiers), pas la faisabilité technique.

**Hors périmètre du bilan métier : HYDRA-TOPOS (POC-IA5).** Projet personnel, développé hors temps et hors commande BRL, présenté comme démo mais volontairement non rattaché à la mission de référent IA.

Les hypothèses sur l'IA intégrée aux éditeurs (Autodesk Assistant, Allplan 2026) et sur les plugins QGIS n'ont pas encore été testées en pratique : elles appartiennent à la phase 2 de la feuille de route (mois 3 à 6), pas encore commencée, et ne peuvent plus être comptées comme acquises tant qu'aucun POC ne les a vérifiées.

## Conclusion

La condition de réussite n'est pas technologique mais organisationnelle : un cadre de sécurité des données clair et appliqué, d'autant plus indispensable que l'usage sauvage existe déjà partout, faute d'outil officiel.

La crainte de cette évolution est encore assez répandue dans les différents corps de métier. Sans l'intérêt d'une majorité de personnes, le développement de nouvelles méthodes ne peut pas avancer correctement et l'écart se creuse avec les concurrents.

A titre plus personnel, je remarque que les progrès sont déjà fascinants dans notre domaine. La majeure partie du temps consacré à ces POC à été absorbé par Claude Code, au détriment d'autres outils, tant il est supérieur à ses concurrents/équivalents. Ce n'est pas forcément cela qui était prévu au départ, mais son avance l'a rendu indispensable.
Mais il reste un tas d'autres outils/solutions pour parvenir à nos fins, et espérer améliorer nos conditions de travail.