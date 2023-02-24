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
