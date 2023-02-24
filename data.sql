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

/*Part Four*/
-- Insert data into vets table
INSERT INTO vets (name, age, date_of_graduation)
VALUES
    ('William Tatcher', 45, '2000-04-23'),
    ('Maisy Smith', 26, '2019-01-17'),
    ('Stephanie Mendez', 64, '1981-05-04'),
    ('Jack Harkness', 38, '2008-06-08');

-- Insert data into specializations table
INSERT INTO specializations (vet_id, species_id) 
SELECT id, (SELECT id FROM species WHERE name = 'Pokemon') 
FROM vets 
WHERE name = 'William Tatcher';

INSERT INTO specializations (vet_id, species_id) 
SELECT id, (SELECT id FROM species WHERE name = 'Digimon') 
FROM vets 
WHERE name = 'Stephanie Mendez';

INSERT INTO specializations (vet_id, species_id) 
SELECT id, (SELECT id FROM species WHERE name = 'Pokemon') 
FROM vets 
WHERE name = 'Stephanie Mendez';

INSERT INTO specializations (vet_id, species_id) 
SELECT id, (SELECT id FROM species WHERE name = 'Digimon') 
FROM vets 
WHERE name = 'Jack Harkness';

-- Insert data into visits table '

-- Agumon visited William Tatcher on May 24th, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-05-24'
FROM animals
INNER JOIN vets ON vets.name = 'William Tatcher'
WHERE animals.name = 'Agumon';

-- Agumon visited Stephanie Mendez on Jul 22th, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-07-22'
FROM animals
INNER JOIN vets ON vets.name = 'Stephanie Mendez'
WHERE animals.name = 'Agumon';

-- Gabumon visited Jack Harkness on Feb 2nd, 2021
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2021-02-02'
FROM animals
INNER JOIN vets ON vets.name = 'Jack Harkness'
WHERE animals.name = 'Gabumon';

-- Pikachu visited Maisy Smith on Jan 5th, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-01-05'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith'
WHERE animals.name = 'Pikachu';

-- Pikachu visited Maisy Smith on Mar 8th, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-03-08'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith'
WHERE animals.name = 'Pikachu';

-- Pikachu visited Maisy Smith on May 14th, 2020
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-05-14'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith'
WHERE animals.name = 'Pikachu';

-- Devimon visited Stephanie Mendez on May 4th, 2021
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2021-05-04'
FROM animals
INNER JOIN vets ON vets.name = 'Stephanie Mendez'
WHERE animals.name = 'Devimon';

-- Charmander visited Jack Harkness on Feb 24th, 2021
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2021-02-24'
FROM animals
INNER JOIN vets ON vets.name = 'Jack Harkness'
WHERE animals.name = 'Charmander';

-- Plantmon visited Maisy Smith on Dec 21st, 2019
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2019-12-21'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith'
WHERE animals.name = 'Plantmon';

-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-08-10'
FROM animals
INNER JOIN vets ON vets.name = 'William Tatcher'
WHERE animals.name = 'Plantmon';

-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2021-04-07'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith'
WHERE animals.name = 'Plantmon';

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2019-09-29'
FROM animals
INNER JOIN vets ON vets.name = 'Stephanie Mendez'
WHERE animals.name = 'Squirtle';

-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-10-03'
FROM animals
INNER JOIN vets ON vets.name = 'Jack Harkness'
WHERE animals.name = 'Angemon';

-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-11-04'
FROM animals
INNER JOIN vets ON vets.name = 'Jack Harkness'
WHERE animals.name = 'Angemon';

-- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2019-01-24'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith'
WHERE animals.name = 'Boarmon';

-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2019-05-15'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith'
WHERE animals.name = 'Boarmon';

-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-02-27'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith'
WHERE animals.name = 'Boarmon';

-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-08-03'
FROM animals
INNER JOIN vets ON vets.name = 'Maisy Smith'
WHERE animals.name = 'Boarmon';

-- Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2020-05-24'
FROM animals
INNER JOIN vets ON vets.name = 'Stephanie Mendez'
WHERE animals.name = 'Blossom';

-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (animal_id, vet_id, visit_date)
SELECT animals.id, vets.id, '2021-01-11'
FROM animals
INNER JOIN vets ON vets.name = 'William Tatcher'
WHERE animals.name = 'Blossom';
