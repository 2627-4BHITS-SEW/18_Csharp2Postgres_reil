CREATE DATABASE hellodatabase;
\connect hellodatabase

CREATE TABLE personen (
  id SERIAL PRIMARY KEY,
  vorname TEXT NOT NULL,
  nachname TEXT NOT NULL,
  alter_jahre INT NOT NULL
);

INSERT INTO personen (vorname, nachname, alter_jahre) VALUES
  ('Anna', 'Huber', 17),
  ('Max', 'Mueller', 18),
  ('Lena', 'Bauer', 17),
  ('Paul', 'Gruber', 19);

CREATE TABLE haustiere (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  tierart TEXT NOT NULL,
  person_id INT NOT NULL REFERENCES personen(id)
);

INSERT INTO haustiere (name, tierart, person_id) VALUES
  ('Bello', 'Hund', 1),
  ('Mieze', 'Katze', 1),
  ('Hoppel', 'Hase', 2),
  ('Flocke', 'Katze', 3);
