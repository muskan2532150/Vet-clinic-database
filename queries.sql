/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals where name like '%mon' ;
SELECT name from animals where EXTRACT(YEAR FROM date_of_birth) between 2016 AND 2019;
SELECT name from animals where neutered='true' AND escape_attempts>'3'; 
SELECT date_of_birth from animals where name='Agumon' OR name='pikachu';
SELECT name,escape_attempts from animals where weight_kg>'10.5';
SELECT * from animals where neutered='true';
SELECT * from animals where NOT name='Gabumon';
SELECT * from animals where weight_kg between 10.4 AND 17.3;


begin;
update animals set species='unspecified';
rollback;


begin;
update animals set species='digimon' where name like '%mon';
update animals set species='Pokimon' where NOT name like '%mon';
commit;
rollback;


begin;
DELETE FROM animals;
rollback;


begin;

DELETE from animals where date_of_birth>='2022-01-01';
select * from animals;
savepoint one;
UPDATE animals set weight_kg = weight_kg * -1;
select * from animals;
rollback to one;
UPDATE animals set weight_kg = weight_kg * -1 where weight_kg < 0;
select * from animals;

commit;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals where escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT name, max(escape_attempts) from animals where neutered = true or neutered = false group by name ORDER by max(escape_attempts) desc;
select max(weight_kg),min(weight_kg) from animals group by species;
select avg(escape_attempts) from animals WHERE EXTRACT(year from date_of_birth) between 1990 AND 2000;

SELECT 
an.name AS animal_name,
ow.full_name AS owner_name 
FROM animals an 
INNER JOIN owners ow
ON ow.id = an.owners_id 
WHERE ow.full_name = 'Melody Pond';

SELECT 
an.name AS animal_name, 
sp.name AS species 
FROM animals an 
INNER JOIN species sp
ON sp.id = an.species_id
WHERE sp.name = 'Pokemon';

SELECT
ow.full_name as owner_name,
an.name as animal_name
FROM owners ow
LEFT JOIN animals an
ON ow.id = an.owners_id

SELECT 
sp.name AS species_name,
COUNT(an.name) AS animal_count
FROM animals an 
INNER JOIN species sp
ON sp.id = an.species_id
GROUP BY sp.name;

SELECT 
ow.full_name as owner_name,
sp.name as species_name,
an.name as animal_name
FROM animals an 
INNER JOIN owners ow
ON ow.id = an.owners_id
INNER JOIN species sp
ON sp.id = an.owners_id
WHERE ow.full_name = 'Jennifer Orwell';

SELECT 
ow.full_name as owner_name,
an.name as animal_name,
an.escape_attempts as check_attempts
FROM animals an 
INNER JOIN owners ow
ON ow.id = an.owners_id
WHERE an.escape_attempts = 0 
AND ow.full_name = 'Dean Winchester';

SELECT 
COUNT(an.name) AS animal_count,
ow.full_name AS owner_name 
FROM animals an 
INNER JOIN owners ow
ON ow.id = an.owners_id 
GROUP BY ow.full_name 
ORDER BY MAX(an.name) DESC;


SELECT 
an.name as animal_name,
ve.name as vet_name,
vi.visit_date
FROM animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
WHERE ve.name = 'William Tatcher' 
ORDER BY vi.visit_date DESC LIMIT 1;

SELECT 
ve.name AS vet_name,
COUNT(an.name) AS animal_count
FROM
animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
WHERE ve.name = 'Stephanie Mendez'
GROUP BY ve.name;

SELECT 
DISTINCT 
ve.name AS vet_name,
sp.name AS animal_type 
FROM
vets ve
LEFT JOIN specializations spe
on ve.id = spe.vet_id 
LEFT JOIN animals an 
on spe.species_id = an.species_id 
LEFT JOIN species sp
ON  an.species_id = sp.id 
ORDER BY ve.name;

SELECT
ve.name AS vet_name,
an.name AS animal_name,
vi.visit_date AS visit_date
FROM
animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
WHERE ve.name = 'Stephanie Mendez' 
AND 
vi.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT
an.name AS animal_name,
COUNT(vi.animal_id) AS most_visits
FROM
animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
GROUP BY an.name
ORDER BY COUNT(vi.animal_id) DESC LIMIT 1;

SELECT 
an.name as animal_name,
ve.name as vet_name,
vi.visit_date
FROM animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
WHERE ve.name = 'Maisy Smith'
ORDER BY visit_date ASC LIMIT 1;

SELECT
an.name AS animal_name,
an.date_of_birth,
an.escape_attempts,
an.neutered,
an.weight_kg,
ve.name AS vet_name,
ve.age,
ve.date_of_graduation,
vi.visit_date
FROM
animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
ORDER BY vi.visit_date DESC LIMIT 1;

SELECT
ve.name AS vet_name,
COUNT(vi.vet_id) AS visit_count
FROM
species sp
RIGHT JOIN specializations spe
ON sp.id = spe.species_id
RIGHT JOIN vets ve
ON ve.id = spe.vet_id
RIGHT JOIN visits vi
ON ve.id = vi.vet_id
WHERE ve.name = 'Maisy Smith'
GROUP BY ve.name;

SELECT
DISTINCT
ve.name AS vet_name,
an.name AS animal_name,
MAX(sp.name) AS animal_type
FROM
animals an
RIGHT JOIN visits vi
ON an.id = vi.animal_id
RIGHT JOIN species sp
ON sp.id = an.species_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
WHERE ve.name = 'Maisy Smith' 
GROUP BY ve.name, an.name
ORDER BY an.name ASC LIMIT 1;