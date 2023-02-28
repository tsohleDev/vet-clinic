/* Database schema to keep the structure of entire database. */

/*Part One*/
CREATE TABLE animals (
  id INT PRIMARY KEY UNIQUE,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10,2)
);

/*Part Two*/

ALTER TABLE animals
ADD COLUMN species varchar(255);

/* Part Three */

-- Create owners table
CREATE TABLE owners (
  id INT PRIMARY KEY UNIQUE,
  full_name VARCHAR(255),
  age INTEGER
);

-- Create species table
CREATE TABLE species (
  id INT PRIMARY KEY UNIQUE,
  name VARCHAR(255)
);

-- Update animals table
ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER,
ADD COLUMN owner_id INTEGER;

ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners(id);

ALTER TABLE animals
ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

/*Part Four*/
-- Create vets table
CREATE TABLE vets (
  id serial PRIMARY KEY,
  name varchar(255),
  age integer,
  date_of_graduation date
);

-- Create specializations table for many-to-many relationship between vets and species
CREATE TABLE specializations (
  vet_id SERIAL REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

-- Create visits table for many-to-many relationship between vets and animals
CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animal_id INTEGER NOT NULL REFERENCES animals(id),
  vet_id INTEGER NOT NULL REFERENCES vets(id),
  visit_date DATE NOT NULL
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Create an indexing for the visits table on the animal_id column
CREATE INDEX animal_id_index ON visits (animal_id);

-- Create an indexing for the visits table on the vet_id column
CREATE INDEX vet_id_index ON visits (vet_id);
