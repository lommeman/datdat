INSERT INTO Teaterstykke(Navn, Salnavn, Tid)
VALUES ('Kongsemnene', 'Hovedscenen', '19:00'),
       ('Størst av alt er kjærligheten', 'Gamle scene', '18:30');

INSERT INTO Forestilling(TeaterstykkeNavn, Dato)
VALUES ('Kongsemnene', '2024-02-01'),
       ('Kongsemnene', '2024-02-02'),
       ('Kongsemnene', '2024-02-03'),
       ('Kongsemnene', '2024-02-05'),
       ('Kongsemnene', '2024-02-06'),
       ('Størst av alt er kjærligheten', '2024-02-03'),
       ('Størst av alt er kjærligheten', '2024-02-06'),
       ('Størst av alt er kjærligheten', '2024-02-07'),
       ('Størst av alt er kjærligheten', '2024-02-12'),
       ('Størst av alt er kjærligheten', '2024-02-13'),
       ('Størst av alt er kjærligheten', '2024-02-14');

INSERT INTO Akt(Teaterstykkenavn, Aktnr, Aktnavn)
VALUES ('Kongsemnene', 1, 'Akt 1'),
       ('Kongsemnene', 2, 'Akt 2'),
       ('Kongsemnene', 3, 'Akt 3'),
       ('Kongsemnene', 4, 'Akt 4'),
       ('Kongsemnene', 5, 'Akt 5'),
       ('Størst av alt er kjærligheten', 1, 'Akt 1');

INSERT INTO Sal(Navn, TeaterstykkeNavn) 
VALUES ('Hovedscenen', 'Kongsemnene'),
       ('Gamle scene', 'Størst av alt er kjærligheten');

INSERT INTO Område(SalNavn, Navn)
VALUES ('Hovedscenen', 'Galleri'),
       ('Hovedscenen', 'Parkett'),
       ('Gamle scene', 'Balkong'),
       ('Gamle scene', 'Parkett'),
       ('Gamle scene', 'Galleri');

INSERT INTO Gruppe(TeaterstykkeNavn, Gruppenavn, Pris)
VALUES ('Kongsemnene', 'Ordinær', 450),
       ('Kongsemnene', 'Honnør', 380),
       ('Kongsemnene', 'Student', 280),
       ('Kongsemnene', 'Gruppe 10', 420),
       ('Kongsemnene', 'Gruppe honnør', 360),
       ('Størst av alt er kjærligheten', 'Ordinær', 350),
       ('Størst av alt er kjærligheten', 'Honnør', 300),
       ('Størst av alt er kjærligheten', 'Student', 220),
       ('Størst av alt er kjærligheten', 'Barn', 220),
       ('Størst av alt er kjærligheten', 'Gruppe 10', 320),
       ('Størst av alt er kjærligheten', 'Gruppe honnør', 270);

INSERT INTO Ansatt (AnsattID, Navn, Epostadresse, Ansattstatus, Stilling)
VALUES 
       (1, 'Arturo Scotti', NULL, 'Fast Ansatt', 'Skuespiller'),
       (2, 'Ingunn Beate Strige Øyen', NULL, 'Frivillig', 'Skuespiller'),
       (3, 'Hans Petter Nilsen', NULL, 'Fast Ansatt', 'Skuespiller'),
       (4, 'Madeleine Brandtzæg Nilsen', NULL, 'Fast Ansatt', 'Skuespiller'),
       (5, 'Synnøve Fossum Eriksen', NULL, 'Fast Ansatt', 'Skuespiller'),
       (6, 'Emma Caroline Deichmann', NULL, 'Fast Ansatt', 'Skuespiller'),
       (7, 'Thomas Jensen Takyi', NULL, 'Fast Ansatt', 'Skuespiller'),
       (8, 'Per Bogstad Gulliksen', NULL, 'Fast Ansatt', 'Skuespiller'),
       (9, 'Isak Holmen Sørensen', NULL, 'Fast Ansatt', 'Skuespiller'),
       (10, 'Fabian Heidelberg Lunde', NULL, 'Fast Ansatt', 'Skuespiller'),
       (11, 'Emil Olafsson', NULL, 'Fast Ansatt', 'Skuespiller'),
       (12, 'Snorre Ryen Tøndel', NULL, 'Fast Ansatt', 'Skuespiller'),
       (13, 'Yury Butusov', NULL, 'Fast Ansatt', 'Stab'),
       (14, 'Aleksandr Shishkin-Hokusai', NULL, 'Fast Ansatt', 'Stab'),
       (15, 'Eivind Myren', NULL, 'Fast Ansatt', 'Stab'),
       (16, 'Mina Rype Stokke', NULL, 'Innleid', 'Stab'),
       (17, 'Sunniva Du Mond Nordal', NULL, 'Fast Ansatt', 'Skuespiller'),
       (18, 'Jo Saberniak', NULL, 'Fast Ansatt', 'Skuespiller'),
       (19, 'Marte M. Steinholt', NULL, 'Fast Ansatt', 'Skuespiller'),
       (20, 'Tor Ivar Hagen', NULL, 'Fast Ansatt', 'Skuespiller'),
       (21, 'Trond-Ove Skrødal', NULL, 'Fast Ansatt', 'Skuespiller'),
       (22, 'Natalie Grøndahl Tangen', NULL, 'Fast Ansatt', 'Skuespiller'),
       (23, 'Åsmund Flaten', NULL, 'Fast Ansatt', 'Skuespiller'),
       (24, 'Jonas Corell Petersen', NULL, 'Fast Ansatt', 'Stab'),
       (25, 'David Gehrt', NULL, 'Fast Ansatt', 'Stab'),
       (26, 'Gaute Tønder', NULL, 'Fast Ansatt', 'Stab'),
       (27, 'Magnus Mikaelsen', NULL, 'Fast Ansatt', 'Stab'),
       (28, 'Kristoffer Spender', NULL, 'Fast Ansatt', 'Stab');

Insert INTO HarRolle(AnsattID, Aktnr, Rollenavn, Teaterstykkenavn)
VALUES (17, 1, 'Kari', 'Størst av alt er kjærligheten'),
       (18, 1, 'Geir', 'Størst av alt er kjærligheten'),
       (19, 1, 'Gunnhild', 'Størst av alt er kjærligheten'),
       (20, 1, 'Nils', 'Størst av alt er kjærligheten'),
       (21, 1, 'Inge', 'Størst av alt er kjærligheten'),
       (22, 1, 'Gudrun', 'Størst av alt er kjærligheten'),
       (23, 1, 'Asgeir', 'Størst av alt er kjærligheten'),
       (1, 1, 'Haakon Haakonssønn', 'Kongsemnene'),
       (1, 2, 'Haakon Haakonssønn', 'Kongsemnene'),
       (1, 3, 'Haakon Haakonssønn', 'Kongsemnene'),
       (1, 4, 'Haakon Haakonssønn', 'Kongsemnene'),
       (1, 5, 'Haakon Haakonssønn', 'Kongsemnene'),
       (2, 1, 'Inga frå Vartejg', 'Kongsemnene'),
       (2, 3, 'Inga frå Vartejg', 'Kongsemnene'),
       (3, 1, 'Skule Jarl', 'Kongsemnene'), 
       (3, 2, 'Skule Jarl', 'Kongsemnene'),
       (3, 3, 'Skule Jarl', 'Kongsemnene'),
       (3, 4, 'Skule Jarl', 'Kongsemnene'),
       (3, 5, 'Skule Jarl', 'Kongsemnene'),
       (4, 1, 'Ragnhild (Skules hustru)', 'Kongsemnene'),
       (4, 5, 'Ragnhild (Skules hustru)', 'Kongsemnene'),
       (5, 1, 'Margrete (Skules datter)', 'Kongsemnene'),
       (5, 2, 'Margrete (Skules datter)', 'Kongsemnene'),
       (5, 3, 'Margrete (Skules datter)', 'Kongsemnene'),
       (5, 4, 'Margrete (Skules datter)', 'Kongsemnene'),
       (5, 5, 'Margrete (Skules datter)', 'Kongsemnene'),
       (6, 1, 'Sigrid (Skules søster)', 'Kongsemnene'),
       (6, 2, 'Sigrid (Skules søster)', 'Kongsemnene'),
       (6, 5, 'Sigrid (Skules søster)', 'Kongsemnene'),
       (6, 4, 'Ingebjørg', 'Kongsemnene'),
       (7, 1, 'Biskop Nikolas', 'Kongsemnene'),
       (7, 2, 'Biskop Nikolas', 'Kongsemnene'),
       (7, 3, 'Biskop Nikolas', 'Kongsemnene'),
       (8, 1, 'Gregorius Jonssønn', 'Kongsemnene'),
       (9, 1, 'Paal Flida', 'Kongsemnene'),
       (9, 2, 'Paal Flida', 'Kongsemnene'),
       (9, 3, 'Paal Flida', 'Kongsemnene'),
       (9, 4, 'Paal Flida', 'Kongsemnene'),
       (9, 5, 'Paal Flida', 'Kongsemnene'),
       (10, 1, 'Baard Bratte', 'Kongsemnene'),
       (10, 2, 'Baard Bratte', 'Kongsemnene'),
       (10, 3, 'Baard Bratte', 'Kongsemnene'),
       (10, 4, 'Baard Bratte', 'Kongsemnene'),
       (10, 5, 'Baard Bratte', 'Kongsemnene'),
       (11, 4, 'Jatgeir Skald', 'Kongsemnene'),
       (11, 1, 'Dagfinn Bonde', 'Kongsemnene'),
       (11, 2, 'Dagfinn Bonde', 'Kongsemnene'),
       (11, 3, 'Dagfinn Bonde', 'Kongsemnene'),
       (11, 4, 'Dagfinn Bonde', 'Kongsemnene'),
       (11, 5, 'Dagfinn Bonde', 'Kongsemnene'),
       (12, 3, 'Peter (prest og Ingebjørgs sønn)', 'Kongsemnene'),
       (12, 4, 'Peter (prest og Ingebjørgs sønn)', 'Kongsemnene'),
       (12, 5, 'Peter (prest og Ingebjørgs sønn)', 'Kongsemnene');

INSERT INTO JobbiStykke(TeaterstykkeNavn, Tittel, AnsattID)
VALUES ('Kongsemnene', 'Regi og musikkutvelgelse', 13),
       ('Kongsemnene', 'Scenografi og kostyer', 14),
       ('Kongsemnene', 'Lysdesign', 15),
       ('Kongsemnene', 'Dramaturg', 16),
       ('Størst av alt er kjærligheten', 'Regi', 24),
       ('Størst av alt er kjærligheten', 'Scenografi og kostyer', 25),
       ('Størst av alt er kjærligheten', 'Musikalsk ansvarlig', 26),
       ('Størst av alt er kjærligheten', 'Lysdesign', 27),
       ('Størst av alt er kjærligheten', 'Dramaturg', 28);

INSERT INTO Kunde(KundeID, Mobilnr, Navn, Adresse)
VALUES (1, '45638291', 'Renegade raider', 'Trondheimsveien 1');