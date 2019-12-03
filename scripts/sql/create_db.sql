DROP TABLE IF EXISTS r_color_character;
DROP TABLE IF EXISTS r_color_species;
DROP TABLE IF EXISTS r_species_designation;
DROP TABLE IF EXISTS r_species_classification;
DROP TABLE IF EXISTS r_terrain_planet;
DROP TABLE IF EXISTS r_gravity_planet;
DROP TABLE IF EXISTS r_climat_planet;

DROP TABLE IF EXISTS characters CASCADE ;
DROP TABLE IF EXISTS starships CASCADE ;
DROP TABLE IF EXISTS vehicles CASCADE ;
DROP TABLE IF EXISTS vehicle_model CASCADE ;
DROP TABLE IF EXISTS starship_classes CASCADE ;
DROP TABLE IF EXISTS vehicle_classes CASCADE ;
DROP TABLE IF EXISTS manufactures CASCADE ;
DROP TABLE IF EXISTS species CASCADE ;
DROP TABLE IF EXISTS planets CASCADE ;
DROP TABLE IF EXISTS terrains CASCADE ;
DROP TABLE IF EXISTS colors CASCADE ;
DROP TABLE IF EXISTS climats CASCADE ;

DROP TYPE IF EXISTS type_color;
DROP TYPE IF EXISTS gender CASCADE ;

CREATE TYPE type_color AS ENUM ('skin', 'hair', 'eye');

CREATE TYPE gender AS ENUM ('male', 'female', 'hermaphrodite');

CREATE TABLE climats (
    name varchar PRIMARY KEY
);

CREATE TABLE colors (
    name varchar PRIMARY KEY
);

CREATE TABLE terrains (
    name varchar PRIMARY KEY
);

CREATE TABLE planets (
    id_planet serial PRIMARY KEY,
    name varchar,
    rotation_period int,
    orbital_period int,
    diameter int,
    surface_water int,
    population int
);

CREATE TABLE species (
    id_species serial PRIMARY KEY,
    name varchar,
    average_height int
);

CREATE TABLE manufactures (
    name varchar PRIMARY KEY
);

CREATE TABLE vehicle_classes (
    name varchar PRIMARY KEY
);

CREATE TABLE starship_classes (
    name varchar PRIMARY KEY
);

CREATE TABLE vehicle_model (
    name varchar PRIMARY KEY
);

CREATE TABLE vehicles (
    id_vehicle serial PRIMARY KEY,
    name varchar,
    id_model varchar,
    id_manufactures varchar,
    cost_in_credits int,
    length float,
    max_atmosphering_speed int,
    crew int,
    passengers int,
    cargo_capacity int,
    consumables varchar,
    id_vehicle_class varchar,
    FOREIGN KEY (id_model) REFERENCES vehicle_model (name),
    FOREIGN KEY (id_manufactures) REFERENCES manufactures (name),
    FOREIGN KEY (id_vehicle_class) REFERENCES vehicle_classes(name)
);

CREATE TABLE starships (
    hyperdrive_rating float,
    mglt int,
    id_starship_classes varchar,
    PRIMARY KEY (id_vehicle),
    FOREIGN KEY (id_model) REFERENCES vehicle_model (name),
    FOREIGN KEY (id_manufactures) REFERENCES manufactures (name),
    FOREIGN KEY (id_vehicle_class) REFERENCES vehicle_classes(name),
    FOREIGN KEY (id_starship_classes) REFERENCES starship_classes (name)
) INHERITS (vehicles);

CREATE TABLE characters (
    id_character serial PRIMARY KEY,
    name varchar,
    height int,
    mass float,
    birth_year varchar,
    gender gender,
    id_homeworld int,
    id_species int,
    FOREIGN KEY (id_homeworld) REFERENCES planets (id_planet),
    FOREIGN KEY (id_species) REFERENCES species (id_species)
);

CREATE TABLE r_climat_planet (
    id_planet int,
    id_climat varchar,
    FOREIGN KEY (id_planet) REFERENCES planets (id_planet),
    FOREIGN KEY (id_climat) REFERENCES climats (name)
);

CREATE TABLE r_gravity_planet (
    id_planet int,
    gravity_value float,
    gravity_type varchar,
    gravity_where varchar,
    FOREIGN KEY (id_planet) REFERENCES planets (id_planet)
);

CREATE TABLE r_terrain_planet (
    id_terrain varchar,
    id_planet int,
    FOREIGN KEY (id_terrain) REFERENCES terrains (name),
    FOREIGN KEY (id_planet) REFERENCES planets (id_planet)
);

CREATE TABLE r_species_classification (
    id_classification serial PRIMARY KEY,
    name varchar,
    id_species int,
    FOREIGN KEY (id_species) REFERENCES species (id_species)
);

CREATE TABLE r_species_designation (
    id_designation serial PRIMARY KEY,
    name varchar,
    id_species int,
    FOREIGN KEY (id_species) REFERENCES species (id_species)
);

CREATE TABLE r_color_species (
    id_species int,
    colorType type_color,
    color varchar,
    FOREIGN KEY (id_species) REFERENCES species (id_species),
    FOREIGN KEY (color) REFERENCES colors (name)
);

CREATE TABLE r_color_character (
    id_character int,
    colorType type_color,
    color varchar,
    FOREIGN KEY (id_character) REFERENCES characters (id_character),
    FOREIGN KEY (color) REFERENCES colors (name)
);