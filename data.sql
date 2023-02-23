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


