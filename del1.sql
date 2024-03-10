CREATE TABLE Teaterstykke(
    Navn TEXT NOT NULL, 
    Salnavn TEXT NOT NULL, 
    Tid TEXT, 
    PRIMARY KEY(Navn),
    FOREIGN KEY(Salnavn) REFERENCES Sal(Navn)
);

CREATE TABLE TeaterStykkerIteater(
    TeaterNavn TEXT NOT NULL, 
    Teaterstykkenavn TEXT NOT NULL, 
    PRIMARY KEY(Teaterstykkenavn),
    FOREIGN KEY(Teaterstykkenavn) REFERENCES Teaterstykke(Navn)
);

CREATE TABLE TeaterDirektør(
    TeaterNavn TEXT NOT NULL,
    DirektørAnsattID INTEGER NOT NULL,
    PRIMARY KEY(TeaterNavn),  
    FOREIGN KEY(DirektørAnsattID) REFERENCES Ansatt(AnsattID),
    FOREIGN KEY(TeaterNavn) REFERENCES Teater(TeaterNavn)
);

CREATE TABLE Forestilling(
    TeaterstykkeNavn TEXT NOT NULL,
    Dato DATE NOT NULL,
    PRIMARY KEY(TeaterstykkeNavn, Dato),
    FOREIGN KEY(TeaterstykkeNavn) REFERENCES Teaterstykke(Navn)
);

CREATE TABLE Akt(
    Teaterstykkenavn TEXT NOT NULL,
    Aktnr INTEGER NOT NULL,
    Aktnavn TEXT NOT NULL, 
    PRIMARY KEY(Teaterstykkenavn, Aktnr),
    FOREIGN KEY(Teaterstykkenavn) REFERENCES Teaterstykke(Navn)
);
-- Alle teaterstykker må være i Akt tabellen.    

CREATE TABLE HarRolle(
    Aktnr INTEGER NOT NULL,
    AnsattID INTEGER NOT NULL,
    Rollenavn TEXT NOT NULL, 
    PRIMARY KEY(Aktnr, AnsattID),
    FOREIGN KEY(Aktnr) REFERENCES Akt(Aktnr),
    FOREIGN KEY(AnsattID) REFERENCES Ansatt(AnsattID)
);

CREATE TABLE JobbiStykke(
    TeaterstykkeNavn TEXT NOT NULL,
    Tittel TEXT NOT NULL,
    AnsattID INTEGER NOT NULL,
    PRIMARY KEY(TeaterstykkeNavn, Tittel),
    FOREIGN KEY(TeaterstykkeNavn) REFERENCES Teaterstykke(Navn),
    FOREIGN KEY(AnsattID) REFERENCES Ansatt(AnsattID)
);

CREATE TABLE Ansatt(
    AnsattID INTEGER NOT NULL,
    Navn TEXT NOT NULL,
    Epostadresse TEXT, --Ikke alle har nødvendigvis en epostadresse i vår miniverden. Feks bestemor.
    Ansattstatus TEXT NOT NULL CHECK(Stilling IN ('Midlertidig ansatt', 'Fast Ansatt', 'Innleid', 'Frivillig')),
    Stilling TEXT NOT NULL CHECK(Ansattstatus IN ('Stab', 'Skuespiller')),
    PRIMARY KEY(AnsattID)
);

CREATE TABLE Sal(
    Navn TEXT NOT NULL,
    TeaterstykkeNavn TEXT,
    PRIMARY KEY(Navn),
    FOREIGN KEY(TeaterstykkeNavn) REFERENCES Teaterstykke(Navn)
);

CREATE TABLE Billettkjøp(
    BillettID INTEGER NOT NULL,
    SamlekjøpID INTEGER NOT NULL,
    PRIMARY KEY(BillettID),
    FOREIGN KEY(BillettID) REFERENCES Billett(BillettID),
    FOREIGN KEY(SamlekjøpID) REFERENCES Samlekjøp(SamlekjøpID)
);

CREATE TABLE Billett(
    BillettID INTEGER NOT NULL,
    Setenr INTEGER NOT NULL,
    Radnr INTEGER NOT NULL,
    OmrådeNavn TEXT NOT NULL,
    Pris REAL NOT NULL,
    PRIMARY KEY(BillettID),
    FOREIGN KEY(OmrådeNavn) REFERENCES Område(Navn),
    FOREIGN KEY(Pris) REFERENCES Gruppe(Pris)
);

CREATE TABLE BillettSolgtTilForestilling(
    BillettID INTEGER NOT NULL,
    ForestillingDato DATE NOT NULL,
    TeaterstykkeNavn TEXT NOT NULL,
    PRIMARY KEY(BillettID),
    FOREIGN KEY(BillettID) REFERENCES Billett(BillettID),
    FOREIGN KEY(ForestillingDato) REFERENCES Forestilling(Dato),
    FOREIGN KEY(TeaterstykkeNavn) REFERENCES Teaterstykke(Navn)
);
 
CREATE TABLE Område(
    SalNavn TEXT NOT NULL,
    Navn TEXT NOT NULL,
    PRIMARY KEY(SalNavn, Navn),
    FOREIGN KEY(SalNavn) REFERENCES Sal(Navn)
);

CREATE TABLE Gruppe(
    TeaterstykkeNavn TEXT NOT NULL,
    Gruppenavn TEXT NOT NULL,
    Pris INTEGER NOT NULL, -- pris må være satt for hver gruppe som tilbys for et teaterstykke
    PRIMARY KEY(TeaterstykkeNavn, Gruppenavn),
    FOREIGN KEY(TeaterstykkeNavn) REFERENCES Teaterstykke(Navn)
);

CREATE TABLE Samlekjøp(
    SamlekjøpID INTEGER NOT NULL,
    KundeID INTEGER NOT NULL,
    Dato DATE NOT NULL,
    Tid TEXT NOT NULL,
    PRIMARY KEY(SamlekjøpID),
    FOREIGN KEY(KundeID) REFERENCES Kunde(KundeID)
);

CREATE TABLE Kunde(
    KundeID INTEGER NOT NULL,
    Mobilnr TEXT NOT NULL CHECK (length(Mobilnr) = 8), --må være et norskt nummer
    Navn TEXT NOT NULL,
    Adresse TEXT,
    PRIMARY KEY(KundeID)
);

INSERT INTO Sal(Navn, TeaterstykkeNavn) 
VALUES ('Hovedscnen', 'Kongsemnene'),
       ('Gamle scene', 'Størst av alt er kjærligheten');

INSERT INTO Teaterstykke(Navn, Salnavn, Tid)
VALUES ('Kongsemnene', 'Hovedscnen', '19:00'),
       ('Størst av alt er kjærligheten', 'Gamle scene', '18:30');

INSERT INTO Område(SalNavn, Navn)
VALUES ('Hovedscnen', 'Venstre galleri'),
       ('Hovedscnen', 'Høyre galleri'),
       ('Hovedscnen', 'Parkett'),
       ('Gamle scene', 'Balkong'),
       ('Gamle scene', 'Parkett'),
       ('Gamle scene', 'Galleri');

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
VALUES ('Kongsemnene', '1', 'Akt 1'),
       ('Kongsemnene', '2', 'Akt 2'),
       ('Kongsemnene', '3', 'Akt 3'),
       ('Kongsemnene', '4', 'Akt 4'),
       ('Kongsemenene', '5', 'Akt 5'),
       ('Størst av alt er kjærligheten', '1', 'Akt 1');

INSERT INTO Ansatt(AnsattID, Navn, Epostadresse, Ansattstatus, Stilling)
VALUES ('1', ' Elisabeth Egseth Hansen', NULL, 'Fast Ansatt', 'Stab'),
       ('2', '')

INSERT INTO Gruppe(TeaterstykkeNavn, Gruppenavn, Pris)
VALUES ('Kongsemnene', 'Ordinær', '450'),
       ('Kongsemnene', 'Honnør', '380'),
       ('Kongsemnene', 'Student', '280'),
       ('Kongsemnene', 'Gruppe 10', '420'),
       ('Kongsemnene', 'Gruppe honnør', '360'),
       ('Størst av alt er kjærligheten', 'Ordinær', '350'),
       ('Størst av alt er kjærligheten', 'Honnør', '300'),
       ('Størst av alt er kjærligheten', 'Student', '220'),
       ('Størst av alt er kjærligheten', 'Barn', '220'),
       ('Størst av alt er kjærligheten', 'Gruppe 10', '320'),
       ('Størst av alt er kjærligheten', 'Gruppe honnør', '270');

--SELECT name FROM sqlite_master WHERE type='table';