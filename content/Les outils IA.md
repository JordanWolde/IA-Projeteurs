---
id: 20260805-2250
title: Les outils IA
type: note
domain: ia
status: stable
created: 2026-08-05
updated: 2026-09-03
tags:
  - veille
  - revit
  - allplan
  - qgis
summary: Panorama des outils IA applicables au métier de projeteur BIM (au 05/08/2026), du plus généraliste (Claude, ChatGPT, Gemini, Mistral, Copilot) au plus spécialisé (Autodesk, Allplan, rendus, SIG, nuages de points). Comprend un tableau récapitulatif coût et verdict par outil.
revu: true
---
## 1. Assistants généralistes (transversal)

La brique la plus immédiatement utile et la moins chère : un assistant dans le navigateur, à côté des logiciels métier, pour produire du texte, du code et de l'analyse/débogage.

### Claude (Anthropic)

| **Description**      | Assistant généraliste américain. Référence actuelle sur la génération de code et l'analyse de documents longs.                                                                                                                                                                  |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Usages projeteur** | Scripts Dynamo / Python / AutoLISP et débogage ; analyse de CCTP et de rapports (géotechnique, hydraulique) ; rédaction de chartes BIM, conventions, modes opératoires, comptes rendus ; formules Excel. Claude Code permet en plus d'automatiser des traitements sur fichiers. |
| **Prérequis**        | Navigateur + Internet. Une demi-journée de formation aux prompts suffit à être efficace.                                                                                                                                                                                        |
| **Coût**             | Claude Team ≈ 25–28 € HT/util./mois avec engagement contractuel de non-entraînement.                                                                                                                                                                                            |
| **Avantages**        | Excellent en français ; très fort sur le code et les documents volumineux ; garanties de confidentialité en offre entreprise.                                                                                                                                                   |
| **Limites**          | Hébergement aux États-Unis (droit américain) ; pas d'accès natif aux maquettes ; réponses à vérifier.                                                                                                                                                                           |

### ChatGPT (OpenAI)

| **Description**      | Le plus répandu du marché. Fonctionnalités comparables, écosystème le plus riche (connecteurs, agents, images intégrées). |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| **Usages projeteur** | Identiques à Claude. La génération d'images intégrée dépanne pour des illustrations.                                      |
| **Coût**             | Team ≈ 25–30 €/util./mois avec non-entraînement.                                                                          |
| **Avantages**        | Écosystème riche ; multimodal ; grosse communauté.                                                                        |
| **Limites**          | Hébergement aux États-Unis ; français légèrement en retrait sur les documents techniques.                                 |

### Gemini (Google)

| **Description**      | Assistant généraliste de Google. Fenêtre de contexte parmi les plus grandes du marché, multimodal (texte, image, vidéo), intégré à Google Workspace et Android.                                               |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Usages projeteur** | Identiques aux autres assistants généralistes ; le contexte très large aide à faire ingérer plusieurs documents longs d'un coup (CCTP + rapports annexes) sans avoir à les découper.                          |
| **Coût**             | Google AI Pro (grand public) ≈ 22 €/mois.                                                                                                                                                                     |
| **Avantages**        | Fenêtre de contexte très large ; bon niveau multimodal (lecture d'images, de plans, de vidéo) ; palier gratuit généreux pour tester.                                                                          |
| **Limites**          | Hébergement aux États-Unis ; l'essentiel de la valeur ajoutée (intégration Docs/Sheets/Gmail) ne joue pas dans un environnement M365 ; moins éprouvé que Claude/ChatGPT sur la rédaction technique française. |

### Le Chat / Vibe (Mistral AI) : l'option souveraine

| **Description**      | Assistant français (Mistral, Paris), renommé « Vibe » en mai 2026. Hébergement et traitement en Europe, RGPD natif, modèles déployables sur serveur interne (open source). |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Usages projeteur** | Identiques. Très bonne qualité de rédaction en français.                                                                                                                   |
| **Coût**             | Gratuit limité ; Pro ≈ 14,99 € HT/mois (le moins cher du marché) ; Team / Enterprise sur devis avec option de déploiement local.                                           |
| **Avantages**        | Souveraineté européenne (argument fort face aux clients publics) ; prix ; possibilité de basculer plus tard en interne pour les données sensibles.                         |
| **Limites**          | En retrait des leaders américains sur le raisonnement complexe et l'écosystème ; quelques briques annexes hors UE.                                                         |

### Microsoft 365 Copilot

| **Description**      | IA intégrée à Word, Excel, PowerPoint, Outlook et Teams, connectée aux données de l'entreprise, qui restent dans le tenant Microsoft.                                                                    |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Usages projeteur** | Comptes rendus automatiques de réunions Teams ; rédaction Word ; analyse Excel ; synthèse de fils de mails. Peu d'apport sur le dessin lui-même.                                                         |
| **Prérequis**        | Licences M365 éligibles + vrai travail de gouvernance des droits d'accès : Copilot expose tout ce à quoi l'utilisateur a déjà droit, y compris les documents mal protégés.                               |
| **Coût**             | Business ≈ 15,60 à 18,20 € HT/util./mois (≤ 300 utilisateurs) ; Enterprise ≈ 26 € HT/util./mois, en plus de la licence M365. Copilot Chat, allégé, est désormais inclus dans la plupart des abonnements. |
| **Limites**          | Coût cumulé élevé à l'échelle ; pertinence limitée en production CAO/BIM ; audit des droits indispensable.                                                                                               |

## 2. Modélisation : l'IA intégrée aux logiciels

### Autodesk Assistant (AutoCAD, Revit, Civil 3D 2027)

| **Description**      | Assistant intégré aux versions 2027 (préversion technique incluse dans l'abonnement). Dialogue en français dans un volet du logiciel.                                                                                            |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Usages projeteur** | Sélectionner des objets par type ; vérifier une charte graphique par comparaison à un fichier de normes (DWS) ; produire des listes d'entités exportables vers Excel ; poser des questions sur le logiciel sans quitter l'écran. |
| **Prérequis**        | Migration 2027 ; compte Autodesk ; les échanges transitent par le cloud Autodesk (accès « Forma Data Management Essentials » inclus avec les licences 2027).                                                                     |
| **Coût**             | Inclus dans l'abonnement, aucun surcoût.                                                                                                                                                                                        |
| **Limites**          | Préversion, fiabilité inégale d'après les premiers retours ; envoi d'informations du dessin vers le cloud à faire valider avant usage sur données projet.                                                                        |

### Revit 2027 (serveur MCP)

| **Description**      | Revit 2027 expose en préversion un serveur MCP : une prise standardisée pour connecter un assistant IA externe directement à la maquette ouverte.                           |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Usages projeteur** | Interroger la maquette en langage naturel (« liste les réseaux sans paramètre X »), lancer des vérifications, piloter des modifications de masse (sans écrire de script).   |
| **Prérequis**        | Revit 2027 ; abonnement à un assistant compatible ; un utilisateur avancé pour la mise en place ; cadrage strict des actions autorisées, l'IA pouvant modifier la maquette. |
| **Coût**             | Inclus dans Revit + coût de l'assistant déjà budgété.                                                                                                                       |
| **Avantages**        | Potentiel de rupture : la voie la plus prometteuse pour l'audit et la modification assistée de maquettes dans les deux ans.                                                 |
| **Limites**          | Expérimental ; sauvegardes systématiques et périmètre d'action limité ; à réserver à un référent technique dans un premier temps.                                           |

### Allplan 2026 (AI Assistant, AI Coder, AI Visualizer)

| **Description**      | Trois briques incluses : **AI Assistant** (Allplan Connect, support expert 24/7 sur les workflows Allplan, SCIA, FRILO et les standards du secteur), **AI Coder** (génération de formules et de scripts paramétriques dans Allplan), **AI Visualizer** (visuels d'ambiance depuis le modèle). |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Usages projeteur** | Débloquer une manipulation sans attendre le support ; automatiser du paramétrique répétitif (objets à géométrie variable, règles de calepinage) ; produire des images d'intention en avant-projet.                                                                                            |
| **Prérequis**        | Allplan 2026 + compte Allplan Connect. Pour l'AI Coder : savoir relire et valider les scripts générés.                                                                                                                                                                                        |
| **Coût**             | Inclus dans l'abonnement, aucun surcoût.                                                                                                                                                                                                                                                     |
| **Limites**          | L'AI Coder abaisse la barrière d'entrée mais ne dispense pas de comprendre ce qui est généré ; le Visualizer produit de l'esquisse, pas du rendu technique fidèle.                                                                                                                            |

### Covadis

Pas de fonction IA native chez Geomedia à ce jour. Les gains passent par des leviers indirects : faire écrire par un assistant des routines AutoLISP exécutées dans l'environnement AutoCAD/Covadis (préparation de semis, nettoyage, habillage, contrôles), et utiliser l'assistant comme aide au diagnostic. Aucun coût spécifique au-delà de l'abonnement assistant.

## 3. Mise en page, visualisation, rendus

### Veras (rendus IA depuis Revit)

| **Description**      | Extension qui transforme une vue Revit (ou Forma, SketchUp, Rhino, Archicad) en image d'ambiance générative : matériaux, environnement, heure du jour modifiés en quelques secondes, la géométrie du modèle servant de base. |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Usages projeteur** | Esquisses et variantes d'intention en avant-projet, supports de concertation, insertions rapides (en amont du vrai rendu Lumion).                                                                                            |
| **Prérequis**        | Revit 2021 à 2026 ; compte cloud Veras ; calcul dans le cloud.                                                                                                                                                               |
| **Coût**             | ≈ 29 à 59 $/mois selon formule ; essai gratuit (30 rendus / 15 jours).                                                                                                                                                       |
| **Limites**          | Rendu génératif, non fidèle au détail technique : ne remplace pas Lumion pour les images contractuelles ; les vues partent dans le cloud de l'éditeur ; droits d'usage des images à clarifier avant diffusion externe.       |

### Générateurs d'images grand public (Nano Banana, Midjourney, Flux…)

Générateurs purs, sans lien avec les maquettes. Utiles pour des illustrations génériques de communication ou de concertation (ambiances, pictogrammes), jamais pour représenter fidèlement un ouvrage. ≈ 10 à 40 €/mois. Aucune fidélité au projet, statut juridique des images encore incertain, et vrai risque de confusion si une image générée passe pour une simulation du projet réel. À bannir des documents techniques et contractuels.

### Post-traitement des rendus

Outils d'amélioration d'images par IA (type Topaz) : résolution et netteté des sorties Lumion pour l'impression grand format ou le recadrage. Licence perpétuelle ≈ 200 à 300 €, tourne sur les stations actuelles. Permet de rendre en résolution moyenne puis d'agrandir proprement (gain de temps de calcul, apport cosmétique).

## 4. SIG : l'IA dans QGIS

Bonne nouvelle : extensions gratuites, open source, exécutées en local. dConc aucun envoi de données à un tiers.

**Digitalisation assistée par « Segment Anything » (plugins SAM / GeoAI).** On clique sur un objet de l'orthophoto, l'extension en extrait le contour vectoriel. GeoAI ajoute des modèles spécialisés (arbres, plans d'eau, bâtiments). Usage : emprises, bâtiments, végétation, plans d'eau pour études d'impact, plans de situation, états des lieux. Digitalisation 5 à 10 fois plus rapide que la saisie manuelle des sommets, traitement 100 % local. Contours parfois à reprendre, première installation un peu technique. Gratuit. → **Utilisable**.

**Services cloud d'extraction (Mapflow et équivalents).** Extraction automatique de bâtiments, routes, végétation depuis des images satellite/aériennes, facturée à l'usage (de quelques euros à quelques centaines selon la surface). Les données partent chez un tiers, souvent hors UE : incompatible avec les zones d'étude sensibles, et qualité variable selon les territoires. → **À tester** sur données publiques uniquement ; les solutions locales restent prioritaires.

## 5. Nuages de points et topographie

**Classification automatique (Autodesk).** Segmentation automatique des nuages par IA (sol, végétation, bâtiments, équipements) en bêta via le programme « Infrastructure Futures » et la visionneuse ReCap d'Autodesk Docs. Inclus. Le nettoyage et la classification d'un nuage étant parmi les tâches les plus chronophages, tout gain ici compte. Mais bêta cloud : qualité à valider sur des nuages réels (ouvrages hydrauliques, berges, zones portuaires), et données envoyées au cloud Autodesk. → **À tester** si utilité.

**Scan-to-BIM assisté par IA.** Logiciels spécialisés qui classifient le nuage et aident à reconstruire la maquette (structures, réseaux) ; les éditeurs annoncent environ 50 % de temps gagné sur le traitement. Cible : relevés d'ouvrages à réhabiliter (stations de pompage, ouvrages hydrauliques existants, bâtiments techniques). Suppose une station costaude (≥ 32 Go de RAM, carte graphique dédiée) et des licences sur devis, souvent > 2 000 €/an. → **Pas mûr** tant qu'un flux régulier de projets de réhabilitation n'est pas confirmé.

## 6. Récapitulatif (au 05/08/2026)

| Outil / usage                 | Domaine                | Coût indicatif          | Verdict         |
| ----------------------------- | ---------------------- | ----------------------- | --------------- |
| Claude (Anthropic)            | Transversal            | 28 € HT/util./mois      | Utilisable      |
| ChatGPT (OpenAI)              | Transversal            | 30 €/util./mois         | Utilisable      |
| Le Chat / Vibe (Mistral)      | Transversal souverain  | 15 € HT/mois            | Utilisable      |
| Microsoft 365 Copilot         | Bureautique / réunions | 15,60–26 € HT + M365    | À tester        |
| Autodesk Assistant (2027)     | Modélisation, contrôle | Inclus abonnement       | À tester        |
| Revit 2027 (serveur MCP)      | Modélisation avancée   | Inclus + assistant      | À tester        |
| Allplan AI Assistant + Coder  | Modélisation, support  | Inclus abonnement       | Utilisable      |
| Allplan AI Visualizer         | Rendus d'esquisse      | Inclus abonnement       | À tester        |
| Dynamo + assistant IA         | Automatisation Revit   | Inclus (hors assistant) | Utilisable      |
| Covadis (via AutoLISP + IA)   | Automatisation         | Inclus (hors assistant) | Levier indirect |
| Autodesk Forma                | Études amont           | Inclus collection AEC   | Pas mûr         |
| « Text-to-BIM »               | Modélisation générée   | Non chiffré             | Pas mûr         |
| Relecture de livrables par IA | Contrôle               | Inclus assistant        | À tester        |
| Analyse CCTP / exigences      | Contrôle               | Inclus assistant        | Utilisable      |
| Veras                         | Rendus d'intention     | 29–59 $/mois            | À tester        |
| Générateurs d'images          | Communication          | 10–40 €/mois            | À tester (com.) |
| Mise en page auto par IA      | Mise en page           | Non chiffré             | Pas mûr         |
| Post-traitement de rendus     | Rendus / impression    | ≈ 250 € (achat unique)  | À tester        |
| QGIS (SAM / GeoAI)            | SIG                    | Gratuit                 | Utilisable      |
| QGIS (Deepness)               | SIG                    | Gratuit                 | À tester        |
| Extraction cloud (Mapflow…)   | SIG                    | À l'usage               | À tester *      |
| Classif. nuages Autodesk      | Topographie            | Inclus (bêta)           | À tester *      |
| Scan-to-BIM IA                | Topographie            | Sur devis + matériel    | Pas mûr         |
| Support N1 par assistant IA   | Correction / support   | Inclus assistant        | Utilisable      |
\* Données non sensibles uniquement.