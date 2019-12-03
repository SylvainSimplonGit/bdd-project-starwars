-- Sélectionner les 10 planètes les plus peuplées
SELECT 
  name,
  population
FROM 
  planets
ORDER BY
  population DESC
LIMIT 10
;

-- Sélectionner les 5 planètes les plus grosses
SELECT
  name,
  diameter
FROM
  planets
ORDER BY 
  diameter DESC
LIMIT 5
;

-- Compter le nombre de personnages par planète d'origine
SELECT
  P.name,
  count(characters.id_homeworld) AS Nb_personnages
FROM
  characters,
JOIN planets P on characters.id_homeworld = P.id_planet
;

-- Sélectionner les véhicules les plus chers de chaque catégorie de véhicule
SELECT
  