CREATE TABLE Teaterstykke (
    Navn VARCHAR(255) PRIMARY KEY,
    SalNavn VARCHAR(255) NOT NULL,
    Tid TIME,
    FOREIGN KEY (SalNavn) REFERENCES Sal(Navn)
);

CREATE TABLE Forestilling (
    TeaterstykkeNavn VARCHAR(255) NOT NULL,
    Dato DATE NOT NULL,
    PRIMARY KEY (TeaterstykkeNavn, Dato),
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn)
);

CREATE TABLE Akt (
    TeaterstykkeNavn VARCHAR(255) NOT NULL,
    Aktnr INT NOT NULL,
    AktNavn VARCHAR(255),
    PRIMARY KEY (TeaterstykkeNavn, Aktnr),
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn)
);

CREATE TABLE HarRolle (
    Aktnr INT,
    AnsattID INT,
    Rollenavn VARCHAR(255),
    PRIMARY KEY (Aktnr, AnsattID),
    FOREIGN KEY (Aktnr) REFERENCES Akt(Aktnr),
    FOREIGN KEY (AnsattID) REFERENCES Ansatt(AnsattID)
);

CREATE TABLE JobbiStykke (
    TeaterstykkeNavn VARCHAR(255) NOT NULL,
    Tittel VARCHAR(255) NOT NULL,
    AnsattID INT NOT NULL,
    PRIMARY KEY (TeaterstykkeNavn, Tittel),
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn),
    FOREIGN KEY (AnsattID) REFERENCES Ansatt(AnsattID)
);

CREATE TABLE Ansatt (
    AnsattID INT PRIMARY KEY,
    Navn VARCHAR(255),
    E_postadresse VARCHAR(255),
    Ansattstatus VARCHAR(255),
    Stilling VARCHAR(255)
);

CREATE TABLE Sal (
    Navn VARCHAR(255),
    TeaterstykkeNavn VARCHAR(255) NOT NULL,
    PRIMARY KEY (Navn, TeaterstykkeNavn),
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn)
);

CREATE TABLE Billett (
    BillettID INT PRIMARY KEY,
    Setenr INT,
    Radnr INT,
    ForestillingDato DATE,
    OmrådeNavn VARCHAR(255),
    Pris DECIMAL(10, 2),
    FOREIGN KEY (ForestillingDato) REFERENCES Forestilling(Dato)
);

CREATE TABLE Område (
    SalNavn VARCHAR(255) NOT NULL,
    Navn VARCHAR(255),
    PRIMARY KEY (SalNavn, Navn),
    FOREIGN KEY (SalNavn) REFERENCES Sal(Navn)
);

CREATE TABLE Gruppe (
    TeaterstykkeNavn VARCHAR(255) NOT NULL,
    Gruppenavn VARCHAR(255) NOT NULL,
    Pris DECIMAL(10, 2),
    PRIMARY KEY (TeaterstykkeNavn, Gruppenavn),
    FOREIGN KEY (TeaterstykkeNavn) REFERENCES Teaterstykke(Navn)
);

CREATE TABLE Billetkjøp (
    SamlekjøpID INT,
    BillettID INT,
    PRIMARY KEY (SamlekjøpID, BillettID),
    FOREIGN KEY (SamlekjøpID) REFERENCES Samlekjøp(SamlekjøpID),
    FOREIGN KEY (BillettID) REFERENCES Billett(BillettID)
);

CREATE TABLE Samlekjøp (
    SamlekjøpID INT PRIMARY KEY,
    KundeID INT,
    Dato DATE,
    Tid TIME,
    FOREIGN KEY (KundeID) REFERENCES Kunde(KundeID)
);

CREATE TABLE Kunde (
    KundeID INT PRIMARY KEY,
    Mobilnr VARCHAR(255),
    Navn VARCHAR(255),
    Adresse VARCHAR(255)
);

SELECT name FROM sqlite_master WHERE type='table';