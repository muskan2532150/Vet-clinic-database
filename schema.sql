/* Database schema to keep the structure of entire database. */
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;

CREATE TABLE IF NOT EXISTS owners (
    id SERIAL PRIMARY KEY NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    age NUMERIC NOT NULL
);

CREATE TABLE IF NOT EXISTS species (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS animals (
    id SERIAL PRIMARY KEY NOT NULL,
    species_id INT,
    owners_id INT,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts NUMERIC NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    FOREIGN KEY (species_id)
      REFERENCES species (id),
    FOREIGN KEY (owners_id)
      REFERENCES owners (id)
);

CREATE TABLE IF NOT EXISTS vets(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  age NUMERIC NOT NULL,
  date_of_graduation date NOT NULL
);

CREATE TABLE IF NOT EXISTS specializations(
  vet_id INT,
  species_id INT,
  FOREIGN KEY (species_id)
      REFERENCES species (id),
  FOREIGN KEY (vet_id)
      REFERENCES vets (id)
);

CREATE TABLE IF NOT EXISTS visits(
  animal_id INT,
  vet_id INT,
  visit_date date,
  FOREIGN KEY (animal_id)
      REFERENCES animals (id),
  FOREIGN KEY (vet_id)
      REFERENCES vets (id)
);