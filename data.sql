/* Populate database with sample data. */

/*Part One*/
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  (0, 'Agumon', '2020-02-03', 0, true, 10.23),
  (1, 'Gabumon', '2018-11-15', 2, true, 8),
  (2, 'Pikachu', '2021-01-07', 1, false, 15.04),
  (3, 'Devimon', '2017-05-12', 5, true, 11);

/*Part Two*/
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES 
  (4,'Charmander', '2020-02-08', 0, false, -11, 'lizard'),
  (6,'Plantmon', '2021-11-15', 2, true, -5.7, 'plant'),
  (7,'Squirtle', '1993-04-02', 3, false, -12.13, 'turtle'),
  (8,'Angemon', '2005-06-12', 1, true, -45, 'angel'),
  (9,'Boarmon', '2005-06-07', 7, true, 20.4, 'boar'),
  (10,'Blossom', '1998-10-13', 3, true, 17, 'flower'),
  (11,'Ditto', '2022-05-14', 4, true, 22, 'transformer');

/*Part Three*/
-- Insert data into owners table
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert data into species table
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

-- Update animals table and set species_id
UPDATE animals
SET species_id = CASE 
                    WHEN name LIKE '%mon' THEN 1
                    ELSE 2
                  END;

-- Update animals table and set owner_id
UPDATE animals
SET owner_id = 
  CASE 
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  END;

