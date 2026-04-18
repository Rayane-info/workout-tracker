# Chacun des cours et leurs utilité dans l'implémentation de mon projet:


## Cours 1 :
### Application à mon projet, workout-tracker:
#### On a pu établir Entités, Associations, ainsi que besoins

# Entités
    - Athlète(id,genre,nom,date_naissance,poids,taille)
    - Séance(date,type,duree,nbserie=count(series),series)
    - Série(nom_exercice,charge,repetitions,RPE)
    - Exercice(id,nom,....,)
    - Repas(heure,type,aliments)
    - Aliment(quantité,protéines,glucides,lipides)
    (A voir si j'implémente entité journée)

# Associations
    - Athlète effectue Séance (0:N) par jour
    - Séance contient Série (1:N)
    - Un Exercice est exécuté pendant une ou plusieurs Série  (1:N)
    - Athlète mange Repas  au court de la journée (0:N)
    - Repas contient Aliment (N:M)
            

#  Les besoins:
    - Gérer l'affectation des séries à un athlète
    - Gérer l'affectation de série d'un exercice à une séance
    - Gérer l'affectation d'aliments à un repas
    - Gérer la création de nouveaux exercices
    - Effectuer différents calculs (1RM, Macros d'aliments...)


#   Les liens entre les objets:
        - Un repas est composé d'un ou plusieurs aliments
        - Une séance est composée de une ou plusieurs séries d'un exercice
        - Une série est une exécution d'un exercice avec variables additionnelles
        - Un athlète effectue zéro ou plusieurs séances dans une journée
        - Un athlète mange zéro ou plusieurs aliments/repas par journée
        - Un exercice peut être adapté en fonction de l'athlète et de son objectif(optionnel)


# Cours 2:
### Application à mon projet workout-tracker:

Athlète (<u>id</u>, genre, nom, date_naissance, poids, taille)

Séance (<u>id_seance</u>, date, type, duree, #id_athlète)
    #id_athlète → Athlète(id)

Série (<u>id_serie</u>, charge, repetitions, rpe, #id_seance, #id_exercice)
    #id_seance → Séance(id_seance)
    #id_exercice → Exercice(id_exercice)

Exercice (<u>id_exercice</u>, nom_exercice, description_optionnelle)

Repas (<u>id_repas</u>, heure, type, #id_athlète)
    #id_athlète → Athlète(id)

CompositionRepas (<u>#id_repas, #id_aliment</u>, quantite_consommee)
    #id_repas → Repas(id_repas)
    #id_aliment → Aliment(id_aliment)

Aliment (<u>id_aliment</u>, nom, proteines, glucides, lipides, quantite_unitaire_g)