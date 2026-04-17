# Cours 2 : Modèle relationnel et Passage E/A vers le modèle Relationnel

## Modèles de données

#     Modèle Entité-Association
          – Description haut niveau des données
          – Entité et les liens entre elles (associations)
          – Interface concepteur - client

#     Modèle Relationnel
          – Représentation logique des données, qui sont organisées dans des tables
          – Tables, ensemble de n-uplets qui partagent les mêmes attributs
              - Chaque colonne correspond à un attribut 
              - Chaque ligne correspond à un n-uplet, qui contient n valeurs atomiques de l'attribut
              - Le nombre de colonnes est appelé l'arité de la table
              - Le nombre de lignes est appelé la cardinalité de la table
          – Interface concepteur - développeur
              
##    Clés candidates 
    - Un plus petit sous-ensemble d’attributs qui identifient chaque ligne de manière unique
    - Toutes les valeurs des attributs clés doivent être connues (pas de valeurs NULL)
    - Chaque table a au moins une clé candidate, et on choisit une clé candidate comme clé primaire
    - La clé primaire est soulignée

##    Clés étrangères
  - Sous-ensemble d’attributs dont les valeurs proviennent des clés candidates d’une table (la même ou une autre)
  - Mécanisme de référencement des n-uplets
  - Valeurs permises : valeurs existantes des clés référencées (intégrité référentielle) ou valeur NULL
  - Un attribut peut être à la fois clé primaire et clé étrangère
  - Se note par une astérisque et désignation de la table référencée

## Schéma relationnel : aperçu
    Schéma de relation: R(A1 : D1, A2 : D2, …, Am : Dm)
      - Nom de table: R
      - Attribut Ai avec son domaine Di (ensemble de valeurs atomiques)
      - Précise la clé primaire, les clés candidates et les clés étrangères
    Ensemble des schémas de relations: S = {R1, R2, ..., Rn}

    Avantages:
      ● Simple
      ● Familiarité des utilisateurs avec les tableaux
      ● Fondements solides (Théorie des Ensembles, Logique du Premier Ordre)
      ● Doté de langages de requêtes puissantes (Algèbre relationnelle, SQL)

## Transformation E/A vers le modèle Relationnel

#     Règle pour les Entités
          – Chaque classe d’entité devient une table séparée
          – L'identifiant de l'entité devient la clé primaire de la table

#     Règles pour les Associations
          – Cas 1 (Cardinalité 1:1) : Extension de la table ayant la cardinalité 1:1 avec la clé de l'autre entité et les attributs de l'association
          – Cas 2 (Cardinalités 0:N ou 1:N) : Création d'une nouvelle table dont la clé primaire est composée des identifiants des entités reliées
          – Cas 3 (Cardinalité 0:1) : Deux choix possibles :
              - Extension (comme Cas 1), mais risque de valeurs NULL
              - Création d'une table (comme Cas 2), évite les NULL mais multiplie les tables

#     Règles spécifiques
          – Entités faibles : Création d'une table où la clé est la concaténation de l'identifiant de l'entité faible et de l'entité forte
          – Spécialisation (Héritage) : Création d'une table pour la sur-classe et pour chaque sous-classe ; les sous-classes utilisent l'identifiant de la sur-classe comme clé primaire et étrangère

## Rétro-ingénierie (Relationnel vers E/A)
    Principe : Appliquer les règles à l'envers en analysant les clés et les dépendances
    - Si la clé primaire n'a pas ou une seule clé étrangère -> Entité
    - Si une clé étrangère n'est pas dans la clé primaire -> Association 1:1 ou 0:1
    - Si la clé primaire est composée de plusieurs clés étrangères -> Association 0:N ou 1:N
    - Si la clé primaire est partiellement composée d'une clé étrangère -> Entité faible