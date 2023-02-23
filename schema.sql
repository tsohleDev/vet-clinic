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