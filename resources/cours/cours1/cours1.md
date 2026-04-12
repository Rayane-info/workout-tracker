# Cours 1 : Introduction, Modèle Entités-Associations

## Base de données (BD)
Ensemble structuré de données typées, représentant une réalité spécifique (inventaire, réseau social).

## Architecture Client-Serveur
- **Serveur** : instance d'un **SGBD** (Système de Gestion de BD) qui contrôle l'accès à la BD
- **Clients** : programmes/applications (Python, Java...) qui communiquent avec le Serveur
- **Communication** : échange de **Requêtes** base de données (SQL, protocole JDBC)

## Serveur SGBD
- Reçoit **Requêtes** de tous les **clients** (applications)
- Ordonne, optimise et exécute les requêtes reçues
- Gère les conflits d'accès, les pannes et les requêtes erronées
- Renvoie la réponse aux **clients**

## Architecture à 3 niveaux
- **Niveau externe** : vues utilisateurs (ce que chaque utilisateur voit)
- **Niveau logique** : schéma global (tables, relations, indépendant du stockage)
- **Niveau interne** : stockage physique (fichiers, index, organisation disque)

## Comment construire une BDD

1. **Analyse des besoins**  
   Analyser monde réel et informations pertinentes

2. **Modélisation des données**  
   Formaliser les besoins, conceptions de données  
   Besoins en entités, et lien entre elles → Modèle Entité-Association

3. **Implantation des données et des procédures**  
   Programmation BD, langages spécialisés et faciles à utiliser pour utilisateur

## Modèles de données

### Modèle Entité-Association (E/A)
Description haut niveau des données, entités et liens entre elles (associations), interface concepteur-client.

#### Composants du modèle

- **Entité** : objet du monde réel (physique ou non) identifiable et pertinent pour l'application.  
  **Classe d'entité** : ensemble nommé d'entités ayant les mêmes caractéristiques, notée par un **rectangle**.

  - **Entité faible** : entité dont l'identifiant dépend de l'identifiant d'autres entités (fortes). Notée par un **double rectangle**.
  - **Entité forte** : entité avec son propre identifiant indépendant.

- **Association** : relation entre deux ou plusieurs objets.  
  **Classe d'association** : ensemble nommé de relations du même type entre entités, notée par un **losange**.

- **Attribut** : caractéristique d'objets et relations. Chaque attribut possède un nom.  
  - Attribut d'entité : propriété de l'entité
  - Attribut d'association : propriété qui décrit la relation et non les entités
  - Noté par un **ovale**.
  - **Attribut composé** : décomposable en sous-attributs (ex: Adresse → Rue, Ville, Code Postal)
  - **Attribut multivalué** : peut prendre plusieurs valeurs (ex: numéros de téléphone), noté par **double ovale**.
  - **Attribut dérivé** : calculable à partir d'autres attributs (ex: âge à partir de date_naissance), noté par **ovale pointillé**.
  - **Clé (identifiant)** : attribut ou ensemble d'attributs qui identifie de façon unique une entité, souligné.

### Modèle Relationnel
Représentation logique des données sous forme de tables (relations). Interface concepteur-développeur.

## Cardinalités d'une classe d'association

Pour une entité E participant à une association A :
- **Cardinalité** : couple (min, max) indiquant combien de fois une entité peut participer à l'association.
- min ∈ {0, 1} : participation optionnelle (0) ou obligatoire (1)
- max ∈ {1, N} : nombre maximum de participations

**Types d'associations selon cardinalités max :**
- **1:1** (One-to-One) : max=1 des deux côtés
- **1:N** (One-to-Many) : max=1 d'un côté, max=N de l'autre
- **N:M** (Many-to-Many) : max=N des deux côtés

**Notation** : (min, max) à côté de l'entité sur le trait reliant à l'association.

## Choix de conception

- **Entité vs Attribut** : si une information a besoin d'être décrite par plusieurs attributs → Entité
- **Entité vs Association** : si un lien a ses propres attributs ou peut exister plusieurs fois → Association
- **Entité forte vs faible** : si l'identifiant dépend d'une autre entité → Entité faible
- **Attribut vs Clé étrangère** : dans le modèle E/A on représente le lien par association, pas par clé étrangère (concept relationnel)

## Langages BD

- Langages spécialisés pour gérer des données
- Langages déclaratifs pour faciliter l'utilisation

### Langage de définition des données (DDL)
- Définition du schéma logique (tables) et physique (index, règles d'accès)
- Définition des contraintes (cohérence logique)

### Langage de manipulation des données (DML)
- Interrogations des données (requêtes d'interrogation)
- Insertion, suppression, modification de données (requêtes de mise-à-jour)

---

## Application à mon projet : workout-tracker

### Les besoins
- Gérer l'affectation des séries à un athlète
- Gérer l'affectation de série d'un exercice à une séance
- Gérer l'affectation d'aliments à un repas
- Gérer la création de nouveaux exercices
- Effectuer différents calculs (1RM, Macros d'aliments...)

### Les objets à modéliser
- Les athlètes
- Les séries
- Les séances
- Les repas
- Les aliments
- Les exercices

### Les liens entre les objets
- Un repas est composé d'un ou plusieurs aliments
- Une séance est composée de une ou plusieurs séries d'un exercice
- Une série est une exécution d'un exercice avec variables additionnelles
- Un athlète effectue zéro ou plusieurs séances dans une journée
- Un athlète mange zéro ou plusieurs aliments/repas par journée
- Un exercice peut être adapté en fonction de l'athlète et de son objectif (optionnel)