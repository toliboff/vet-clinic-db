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

-- Insert data into the 'owners' table
INSERT INTO owners (full_name, age) 
                    VALUES  ('Sam Smith',  34),
                            ('Jennifer Orwell', 19),
                            ('Bob', 45),
                            ('Melody Pond', 77),
                            ('Dean Winchester', 14),
                            ('Jodie Whittaker', 38);

-- Insert data into the 'species' table
INSERT INTO species (name) 
                    VALUES  ('Pokemon'),
                            ('Digimon');

  -- Modify your inserted animals to include owner information (owner_id):
    --Sam Smith owns Agumon.
    --Jennifer Orwell owns Gabumon and Pikachu.
    --Bob owns Devimon and Plantmon.
    --Melody Pond owns Charmander, Squirtle, and Blossom.
    --Dean Winchester owns Angemon and Boarmon.
  UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Sam Smith')
  WHERE name='Agumon';

  UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Jennifer Orwell')
  WHERE name IN('Gabumon', 'Pikachu');

  UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Bob')
  WHERE name IN('Devimon', 'Plantmon');

  UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Melody Pond')
  WHERE name IN('Charmander', 'Squirtle', 'Blossom');
  
  UPDATE animals
  SET owner_id=(SELECT id FROM owners WHERE full_name='Dean Winchester')
  WHERE name IN('Angemon', 'Boarmon');