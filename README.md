# May the database be with you

## Description rapide

A l'aide de fichiers CSV contenant des données sur les personnages de la série Star Wars, implémenter une base de données postgresql permettant de stocker ces données

## Livrables attendus

Un schéma du modèle phyisque de la base de données.

Un script au format SQL contenant :

1. La création des tables
1. L'insertion des données
1. Les requêtes de sélection

## Énoncé du brief

Avec les fichiers CSV donnés en pièce jointe, réaliser un schéma physique de base de données permettant d'héberger ces données de manière relationnelle. Puis une fois ceci fait, un script SQL permettant d'utiliser les données fournies avec une base de données Postgres.

Une fois la base de données réalisée, tester votre base en éxécutant les requêtes suivantes :

- Sélectionner les 10 planètes les plus peuplées
- Sélectionner les 5 planètes les plus grosses
- Compter le nombre de personnages par planète d'origine
- Sélectionner les véhicules les plus chers de chaque catégorie de véhicule
- Sélectionner les vaisseaux et afficher le rapport cout / nb_passagers

## Détail des livrables

### Création des tables

le fichier pour créer le schéma de la base se trouve :

- [scripts/sql/create_db.sql](scripts/sql/create_db.sql)

un Modèle de la base se trouve :

- [diagrams/schema.png](diagrams/schema.png)

### L'insertion des données

En cours d'implémentation ...

### Les requêtes de sélection

En cours d'implémentation mais pas de tests possible sans données en base ...
