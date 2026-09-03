---
id: 20260729-2012
title: IA Projeteur
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

Voir [[Les outils IA]] pour plus de précision sur les outils envisagés et disponible à ce stade.
## Hypothèses

Le projet repose sur des hypothèses non démontrées :

- **La plus importante : l'IA de demain fera toujours mieux que celle d'aujourd'hui.** Les verdicts de ce panorama sont une photo à un instant T, pas un jugement définitif : ce qui est immature aujourd'hui (mise en page automatique, Text-to-BIM) peut devenir utilisable d'ici quelques mois.
- **L'IA coûtera de moins en moins cher.** Accès local, augmentation de la cadence de tokens, concurrence entre éditeurs : le coût d'accès devrait continuer de baisser, ce qui change le calcul de rentabilité des cas d'usage jugés aujourd'hui trop chers ou pas assez mûrs pour l'investissement (comme les postes en local par exemple).

## Où on en est

Présentation faite le 29/07/2026 à Julien Helj, sur la base d'une note de veille et d'un plan d'attaque. Décision prise à l'issue de cet échange : proposer des POC courant août à la direction et au relais numérique, puis tester en pratique de septembre à décembre pour trancher ce qui s'industrialise.

Licence Claude Pro côté pro activée le 29/07/2026. Le pilote phase 1 (moins de 500 € HT engagés) peut démarrer sans attendre.

## Deux présentations en septembre

- **8 septembre** : présentation à l'équipe projeteurs, à titre d'info (format réunion d'équipe, 5-10 min), avec démo des projets/POC en cours.
- **Présentation plus officielle à la direction** : certainement courant septembre également (date à préciser). Portée différente : arbitrages, budget, temps alloué, sponsor.

## Ce que l'on attend de l'IA en tant que projeteurs

L'idée était de réaliser un tour de table des besoins des différents projeteurs. De ceci en résulte une liste d'usages attendus clairement définis :

- Supprimer les tâches répétitives à faible valeur ajoutée.
- Accélérer la production de livrables (mise en page automatique).
- Vérifier nos travaux plus efficacement.
- Correction de problèmes et support.
- Augmenter le bien-être par la facilitation des tâches.
- Être plus réactif sur les urgences/imprévus.

Les différents POC se basent sur ces besoins.

## Objectifs de ce travail

- Vérifier la faisabilité de certains objectifs.
- Chiffrer les gains mesurés (temps, coût) pour arbitrer l'industrialisation.
- Sécuriser un cadre d'usage reproductible, indépendant d'une seule personne.
- Limiter les craintes et inconnues.

## ==Feuille de route==

Le reste ci-dessous reste à dérouler.

**Phase 1 (mois 1 à 3) : cadrer et prouver.** Ouvrir 1 licence pro/max d'un assistant (arbitrage Claude / ChatGPT / Mistral selon le critère de souveraineté retenu, Claude de préférence). Cibler des cas d'usage mesurables et les valider/invalider.
Mesurer le temps gagné, la qualité, les incidents pour livrer bilan chiffré.

**Phase 2 (mois 3 à 6) : tester l'IA intégrée.** Passer à Revit 2027, AutoCAD 2027 et Allplan 2026. Activer et évaluer l'Autodesk Assistant à la migration 2027 et les briques IA d'Allplan 2026, déjà incluses. Tester en prod sur un projet non sensible. Expérimenter le serveur MCP de Revit 2027 sur maquettes de test.

**Phase 3 (mois 6 à 12) : industrialiser.** Étendre à ce qui a prouvé sa valeur, constituer une bibliothèque interne de requêtes types et de scripts validés. Étudier une solution souveraine ou locale (Mistral en interne, poste IA dédié) si un besoin sur données sensibles se confirme. Poursuivre la veille (revue semestrielle de ce panorama) et l'animation du sujet.

**Budget.**

| Poste                                    | Coût indicatif HT | Remarque                                                      |
| ---------------------------------------- | ----------------- | ------------------------------------------------------------- |
| 1 licence assistant IA (phase 1, pilote) | 180 à 340 €/an    | Selon l'outil (15 à 28 €/mois)                                |
| IA intégrée Autodesk / Allplan           | 0 €               | Incluse dans les abonnements actuels                          |
| Plugins QGIS (SAM, GeoAI, Deepness)      | 0 €               | Open source                                                   |
| Option phase 3 : poste IA local          | 3 000 à 5 000 €   | Investissement unique, si besoin « données sensibles » validé |

**Budget phase 1 engagé : moins de 500 € HT.** Le reste s'active phase par phase, selon les résultats mesurés.

## Le corps du travail

**Projet = un axe métier avec un objectif "business".** Il porte une problématique (par ex : réduire le temps de production), un périmètre, un sponsor, un budget, une roadmap.

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
- [[POC-IA8 - Vérification des livrables PDF (AKRIBIA)]]
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

## ==Ce qu'on peut en retenir==

- **Trois usages rentables tout de suite, pour 15 à 30 € HT/mois** : génération de scripts (Dynamo, Python, AutoLISP), analyse et rédaction documentaire (CCTP, rapports, chartes, comptes rendus), support technique de premier niveau.
- **Les éditeurs intègrent l'IA sans surcoût.** Autodesk livre un assistant en français dans AutoCAD, Revit et Civil 3D 2027 (préversion incluse dans l'abonnement) ; Allplan 2026 embarque un assistant, un générateur de scripts (AI Coder) et un visualiseur IA. À tester dès les migrations de version.
- **La mise en page automatique de plans n'est pas mûre.** Les rendus IA (Veras, AI Visualizer) servent en esquisse et en concertation, ils ne remplacent ni Lumion ni un plan technique.
- **QGIS est le bon élève** : plugins IA gratuits, efficaces, exécutés en local, sans envoi de données.
- **La sécurité des données conditionne tout le reste.** Ouvrages hydrauliques, portuaires, projets sensibles : pas d'outil grand public gratuit sur de la donnée projet, comptes entreprise avec clause de non-entraînement, et zéro cloud sur les projets sensibles (référentiel ANSSI).

## Conclusion

La condition de réussite n'est pas technologique mais organisationnelle : un cadre de sécurité des données clair et appliqué, d'autant plus indispensable que l'usage sauvage existe déjà partout, faute d'outil officiel.

La crainte de cette évolution est encore assez répandue dans les différents corps de métier. Sans l'intérêt d'une majorité de personnes, le développement de nouvelles méthodes ne peut pas avancer correctement et l'écart se creuse avec les concurrents.

A titre plus personnel, je remarque que les progrès sont déjà fascinants dans notre domaine. La majeure partie du temps consacré à ces POC à été absorbé par Claude Code, au détriment d'autres outils, tant il est supérieur à ses concurrents/équivalents. Ce n'est pas forcément cela qui était prévu au départ, mais son avance l'a rendu indispensable.
Mais il reste un tas d'autres outils/solutions pour parvenir à nos fins, et espérer améliorer nos conditions de travail.