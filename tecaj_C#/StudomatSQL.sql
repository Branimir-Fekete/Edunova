USE master;
GO
DROP DATABASE IF EXISTS studomat;
CREATE DATABASE studomat;
GO
USE studomat;

CREATE TABLE sveucilista (
  sveuciliste_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  naziv VARCHAR(255) NOT NULL,
  adresa VARCHAR(255) NOT NULL
);

CREATE TABLE profesori (
  profesor_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  ime VARCHAR(100) NOT NULL,
  prezime VARCHAR(100) NOT NULL,
  oib CHAR(11),
  sveuciliste_id INT
);

CREATE TABLE kolegiji (
  kolegij_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  naziv VARCHAR(255) NOT NULL,
  opis TEXT
);

CREATE TABLE profesor_kolegij (
  profesor_id INT,
  kolegij_id INT
);

CREATE TABLE ispiti (
  ispit_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  naziv VARCHAR(255) NOT NULL,
  datum DATE NOT NULL,
  ocijena INT NOT NULL,
  prolaz BIT,
  kolegij_id INT
);

CREATE TABLE studenti (
  student_id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  ime VARCHAR(100) NOT NULL,
  prezime VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  JMBAG CHAR(11),
  godina_studija INT,
  sveuciliste_id INT
);

CREATE TABLE student_profesori (
  student_id INT,
  profesor_id INT
);

CREATE TABLE student_kolegiji (
  student_id INT,
  kolegij_id INT
);

CREATE TABLE student_ispiti (
  student_id INT,
  ispit_id INT
);


/*
====================================================================================
ALTER TABLE (STVARANJE VEZA ZA TABLICE)
====================================================================================
*/

ALTER TABLE ispiti
ADD FOREIGN KEY (kolegij_id) REFERENCES kolegiji(kolegij_id);

ALTER TABLE profesori
ADD FOREIGN KEY (sveuciliste_id) REFERENCES sveucilista(sveuciliste_id);

ALTER TABLE studenti
ADD FOREIGN KEY (sveuciliste_id) REFERENCES sveucilista(sveuciliste_id);

ALTER TABLE profesor_kolegij
ADD FOREIGN KEY (kolegij_id) REFERENCES kolegiji(kolegij_id);

ALTER TABLE profesor_kolegij
ADD FOREIGN KEY (profesor_id) REFERENCES profesori(profesor_id);

ALTER TABLE studenti
ADD FOREIGN KEY (sveuciliste_id) REFERENCES sveucilista(sveuciliste_id);

ALTER TABLE student_profesori
ADD FOREIGN KEY (student_id) REFERENCES studenti(student_id);

ALTER TABLE student_profesori
ADD FOREIGN KEY (profesor_id) REFERENCES profesori(profesor_id);

ALTER TABLE student_kolegiji
ADD FOREIGN KEY (student_id) REFERENCES studenti(student_id);

ALTER TABLE student_kolegiji
ADD FOREIGN KEY (kolegij_id) REFERENCES kolegiji(kolegij_id);

ALTER TABLE student_ispiti
ADD FOREIGN KEY (student_id) REFERENCES studenti(student_id);

ALTER TABLE student_ispiti
ADD FOREIGN KEY (ispit_id) REFERENCES ispiti(ispit_id);


/*
====================================================================================
INSERT (UNOS PODATAKA U TABLICE)
====================================================================================
*/

INSERT INTO sveucilista (naziv, adresa) VALUES
  ('Sveu�ili�te Harvard', 'SAD'),
  ('Sveu�ili�te Oxford', 'Velika Britanija'),
  ('Sveu�ili�te Stanford', 'SAD'),
  ('MIT', 'SAD'),
  ('Kalifornijski institut za tehnologiju', 'SAD'),
  ('Sveu�ili�te Cambridge', 'Velika Britanija'),
  ('ETH Z�rich', '�vicarska'),
  ('Sveu�ili�te u Torontu', 'Kanada'),
  ('Nacionalno sveu�ili�te u Singapuru', 'Singapur'),
  ('Sveu�ili�te u Sydneyju', 'Australija');



INSERT INTO profesori (ime, prezime, oib, sveuciliste_id) VALUES
  ('Ivan', 'Horvat', '12345678901', 1),
  ('Marija', 'Kova�', '23456789012', 2),
  ('Marko', 'Babi�', '34567890123', 3),
  ('Ana', 'Petrovi�', '45678901234', 4),
  ('Ivana', 'Juri�', '56789012345', 5),
  ('Ante', 'Novak', '67890123456', 6),
  ('Maja', 'Kne�evi�', '78901234567', 7),
  ('Tomislav', 'Vukovi�', '89012345678', 8),
  ('Martina', '�imunovi�', '90123456789', 9),
  ('Petar', 'Radi�', '01234567890', 10);

INSERT INTO kolegiji (naziv, opis) VALUES
  ('Matematika', 'Ovaj kolegij pokriva osnove matematike.'),
  ('Fizika', 'Fizika je prirodna znanost koja prou�ava temeljne zakone prirode.'),
  ('Informatika', 'Kolegij informatike bavi se ra�unalnim znanostima i programiranjem.'),
  ('Povijest umjetnosti', 'Prou�ava se povijest razvoja umjetnosti kroz razli�ite epohe.'),
  ('Ekonomija', 'Ekonomija se bavi prou�avanjem proizvodnje, distribucije i potro�nje resursa.'),
  ('Biologija', 'Biologija je znanost koja prou�ava �ive organizme i njihove interakcije.'),
  ('Sociologija', 'Sociologija se bavi prou�avanjem dru�tva i dru�tvenih odnosa.'),
  ('Psihologija', 'Psihologija prou�ava ljudsko pona�anje i mentalne procese.'),
  ('Lingvistika', 'Lingvistika se bavi prou�avanjem jezika i njegovih aspekata.'),
  ('Arhitektura', 'Arhitektura je umjetnost projektiranja i izgradnje gra�evina i prostora.');

  
INSERT INTO ispiti (naziv, datum, ocijena, prolaz, kolegij_id) VALUES
  ('Ispit iz Matematike', '2023-01-15', 3, 1, 1),
  ('Ispit iz Fizike', '2023-01-16', 4, 1, 2),
  ('Ispit iz Informatike', '2023-01-17', 5, 1, 3),
  ('Ispit iz Povijesti umjetnosti', '2023-01-18', 2, 0, 4),
  ('Ispit iz Ekonomije', '2023-01-19', 4, 1, 5),
  ('Ispit iz Biologije', '2023-01-20', 3, 1, 6),
  ('Ispit iz Sociologije', '2023-01-21', 5, 1, 7),
  ('Ispit iz Psihologije', '2023-01-22', 2, 0, 8),
  ('Ispit iz Lingvistike', '2023-01-23', 5, 1, 9),
  ('Ispit iz Arhitekture', '2023-01-24', 4, 1, 10);

INSERT INTO studenti (ime, prezime, email, JMBAG, godina_studija, sveuciliste_id) VALUES
  ('Ana', 'Horvat', 'ana.horvat@efos.hr', '12345678901', 1, 1),
  ('Ivan', 'Kova�', 'ivan.kovac@fazos.hr', '23456789012', 2, 2),
  ('Marta', 'Babi�', 'marta.babic@gfos.hr', '34567890123', 3, 3),
  ('Petar', 'Novak', 'petar.novak@ffos.hr', '45678901234', 1, 4),
  ('Elena', 'Petrovi�', 'elena.petrovic@efos.hr', '56789012345', 2, 5),
  ('Marko', 'Horvat', 'marko.horvat@fazos.hr', '67890123456', 3, 6),
  ('Lea', 'Kova�evi�', 'lea.kovacevic@gfos.hr', '78901234567', 1, 7),
  ('Filip', 'Mari�', 'filip.maric@ffos.hr', '89012345678', 2, 8),
  ('Jana', 'Peri�', 'jana.peric@efos.hr', '90123456789', 3, 9),
  ('Luka', 'Kova�i�', 'luka.kovacic@fazos.hr', '01234567890', 1, 10);

INSERT INTO profesor_kolegij (profesor_id, kolegij_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
  
INSERT INTO student_profesori (student_id, profesor_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO student_kolegiji (student_id, kolegij_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO student_ispiti (student_id, ispit_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

 /*
====================================================================================
SELECT (PROVJERA STANJA TABLICA)
====================================================================================
*/

SELECT * FROM sveucilista;
SELECT * FROM profesori;
SELECT * FROM kolegiji;
SELECT * FROM ispiti;
SELECT * FROM studenti;
SELECT * FROM profesor_kolegij;
SELECT * FROM student_profesori;
SELECT * FROM student_kolegiji;
SELECT * FROM student_ispiti;