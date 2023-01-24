CREATE TABLE animals (
    id INTEGER,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);


ALTER TABLE animals ADD CONSTRAINT animals_pk PRIMARY KEY (id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN specie_id INTEGER;
ALTER TABLE animals ADD COLUMN owner_id INTEGER;
ALTER TABLE animals ADD CONSTRAINT specie_id FOREIGN KEY (specie_id) REFERENCES species(id);
ALTER TABLE animals ADD CONSTRAINT owners_id FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INTEGER,
    specie_id INTEGER,
    PRIMARY KEY (vet_id, specie_id),
    CONSTRAINT vet_id FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT specie_id FOREIGN KEY (specie_id) REFERENCES species(id)
);

CREATE TABLE visits (
    vet_id INTEGER,
    animal_id INTEGER,
    date_of_visit DATE,
    CONSTRAINT vet_id FOREIGN KEY (vet_id) REFERENCES vets(id),
    CONSTRAINT animal_id FOREIGN KEY (animal_id) REFERENCES animals(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX ON visits(animal_id ASC);
CREATE INDEX ON owners(email);
CREATE INDEX ON vets(id desc);
CREATE INDEX ON animals(id desc);

