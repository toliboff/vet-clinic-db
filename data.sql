/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', '02/03/2020', 0, TRUE, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon', '11/15/2020', 2, TRUE, 8);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', '01/7/2021', 1, FALSE, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', '05/12/2017', 5, TRUE, 11);

-- INSERT DATA
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
                    VALUES  ('Charmander', '02/08/2020', 0, FALSE, 11),
                            ('Plantmon', '11/15/2022', 2, TRUE, 5.7),
                            ('Squirtle', '04/02/1993', 3, FALSE, 12.13),
                            ('Angemon', '06/12/2005', 1, TRUE, 45),
                            ('Boarmon', '06/07/2005', 7, TRUE, 20.4),
                            ('Blossom', '10/13/1998', 3, TRUE, 17);

-- Inside a transaction update the animals table by setting the species column to unspecified
BEGIN;
  UPDATE animals
  SET species='unspecified';
ROLLBACK;

-- Inside a transaction:
-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
  UPDATE animals
  SET species='digimon'
  WHERE name LIKE '%mon';

  -- Update the animals table by setting the species column to pokemon for all animals that don't have species already set
  UPDATE animals
  SET species='pokemon'
  WHERE COALASCE(species, '')='';
COMMIT;