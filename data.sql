/* Populate database with sample data. */

INSERT INTO animals 
(species_id, owners_id, name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES
(2, 1, 'Agumon', '2020-02-03', 0, true, 10.23),
(2, 2, 'Gabumon', '2018-11-15', 2, true, 8),
(1, 2, 'Pikachu', '2021-01-7', 1, false, 15.04),
(2, 3, 'Devimon', '2017-05-12', 5, true, 11), 
(1, 4, 'Charmander', '2020-02-08', 0, false, 11),
(2, 3, 'Plantmon', '2021-11-15', 2, true, 5.2),
(1, 4, 'Squirtle', '1993-04-02', 3, false, 12.13),
(2, 5, 'Angemon', '2005-06-12', 1, true, 45),
(2, 5, 'Boarmon', '2005-06-07', 7, true, 20.4),
(1, 4, 'Blossom', '1998-10-13', 3, true, 17),
(1, NULL, 'Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners 
(full_name, age)
VALUES
('Sam Smith',34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38);


INSERT INTO species 
(name)
VALUES
('Pokemon'),
('Digimon');

INSERT INTO vets 
(name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');


INSERT INTO specializations 
(vet_id, species_id)
VALUES
(1, 1),
(3, 1),
(3, 2),
(4, 2);

INSERT INTO visits 
(animal_id, vet_id, visit_date)
VALUES
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6, 1, '2020-08-10'),
(6, 2, '2021-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 1, '2021-01-11');
