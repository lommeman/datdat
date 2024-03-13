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
    Teaterstykkenavn TEXT NOT NULL,
    PRIMARY KEY(Aktnr, AnsattID, Rollenavn, Teaterstykkenavn),
    FOREIGN KEY(Aktnr) REFERENCES Akt(Aktnr),
    FOREIGN KEY(AnsattID) REFERENCES Ansatt(AnsattID),
    FOREIGN KEY(Teaterstykkenavn) REFERENCES Teaterstykke(Navn)
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
    Ansattstatus TEXT NOT NULL CHECK(Ansattstatus IN ('Midlertidig ansatt', 'Fast Ansatt', 'Innleid', 'Frivillig')),
    Stilling TEXT NOT NULL CHECK(Stilling IN ('Stab', 'Skuespiller')),
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
    Radnr INTEGER NOT NULL, --byttet til text
    OmrådeNavn TEXT NOT NULL,
    PRIMARY KEY(BillettID),
    FOREIGN KEY(OmrådeNavn) REFERENCES Område(Navn)
    
);

--byttet hvor pris står henn, står bare i gruppe nå

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
    Pris INTEGER NOT NULL, -- Endret til integer pris må være satt for hver gruppe som tilbys for et teaterstykke
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

--SELECT name FROM sqlite_master WHERE type='table';
