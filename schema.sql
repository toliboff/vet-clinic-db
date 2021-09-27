/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

-- Add a column species of type string to your animals table. Modify your schema.sql file.
 ALTER TABLE animals ADD COLUMN species VARCHAR(20);

-- Create a table named 'owner'
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(50),
    age INT,
    PRIMARY KEY(id)
)

-- Create a table named 'species'
CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    PRIMARY KEY(id)
)

-- Modify animals table
ALTER TABLE animals
DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners(id);

-- Create a table named 'vets'
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
)

CREATE TABLE specializations (
    vet_id INT,
    species_id INT,
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    FOREIGN KEY(species_id) REFERENCES species(id),
    PRIMARY KEY(vet_id, species_id)  
);

CREATE TABLE visits (
    vet_id INT,
    animal_id INT,
    visited DATE,
    FOREIGN KEY(vet_id) REFERENCES vets(id),
    FOREIGN KEY(animal_id) REFERENCES animals(id)
);

/* Performace Audit */

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Optimize visits table by creating an Index using the animals_id column
CREATE INDEX animals_id_asc ON visits (animals_id ASC);

-- Optimize visits table by creating an Index using the vets_id column
CREATE INDEX vets_id_asc ON visits (vets_id ASC);

-- -- Optimize owners table by creating an Index using the email column
CREATE INDEX owners_email_asc ON owners (email ASC);