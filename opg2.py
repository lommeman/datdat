import sqlite3

with sqlite3.connect('teaterdatabase.db') as conn:
    c = conn.cursor()
    conn = sqlite3.connect('teaterdatabase.db', timeout=10)



def registrert_solge_seter(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()
        dato = ''
        område = ''
        solgt_seter = []
        rad_nr = 0

        områder = set(line.strip() for line in lines if line.strip() in ["Galleri", "Balkong", "Parkett"])
        sal = 'Hovedscenen' if 'Parkett' in områder and 'Galleri' in områder and 'Balkong' not in områder else 'Gamlescenen'

        for line in lines:
            if "Dato" in line: 
                words = line.split()
                for word in words:
                    if len(word) == 10 and word[4] == "-" and word[7] == "-":
                        dato =  word

            elif line.strip() in ["Galleri", "Balkong", "Parkett"]:
                område = line.strip()
                rad_nr = 0
            else:
                rad_nr += 1
                for sete_nr, sete in enumerate(line.strip(), start=1):
                    if sete == '1':
                        if område == 'Galleri' and sal == 'Hovedscenen':
                            if sete_nr <= 10:  
                                område_Galleri = 'Nedre'
                            else:
                                område_Galleri= 'Øvre'

                            solgt_seter.append((sete_nr, område_Galleri, område))
                        else:
                            solgt_seter.append((sete_nr, rad_nr, område))
        return solgt_seter, sal, dato
    
BillettID = 1

def check_kunde_exists(kundeID):
    c.execute("SELECT * FROM Kunde WHERE kundeID = ?", (kundeID,))
    return c.fetchone() is not None

def check_samlekjop_exists(samlekjopID):
    c.execute("SELECT * FROM Samlekjøp WHERE SamlekjøpID = ?", (samlekjopID,))
    return c.fetchone() is not None

def Registrer_Billett(solgt_seter, sal, dato, kundeID):
    global BillettID
    c.execute("SELECT Navn FROM Teaterstykke WHERE Salnavn = ?", (sal,))
    TeaterstykkeNavn = c.fetchone()[0]

    if not check_kunde_exists(1):
        c.execute("INSERT INTO Kunde(kundeID, Mobilnr, Navn, Adresse) VALUES (1, '69696969', 'Renegaid Raider', 'Yo mams blv 69')")
    if not check_kunde_exists(2):
        c.execute("INSERT INTO Kunde(kundeID, Mobilnr, Navn, Adresse) VALUES (2, '47845632', 'Big Chungus', 'Yo dads blv 69')")

    if not check_samlekjop_exists(1):
        c.execute("INSERT INTO Samlekjøp(SamlekjøpID, KundeID, Dato, Tid) VALUES (1, 1, '2023-04-20', '13:37')")
    if not check_samlekjop_exists(2):
        c.execute("INSERT INTO Samlekjøp(SamlekjøpID, KundeID, Dato, Tid) VALUES (2, 2, '2023-04-20', '15:20')")
    
    c.execute("SELECT MAX(BillettID) FROM Billett")
    result = c.fetchone()
    BillettID = result[0] if result[0] is not None else 0

    for sete in solgt_seter:
        BillettID += 1
        c.execute("INSERT INTO Billett(BillettID, Setenr, Radnr, OmrådeNavn) VALUES (?, ?, ?, ?)", (BillettID,) + sete)
        c.execute("INSERT INTO BillettSolgtTilForestilling(BillettID, ForestillingDato, TeaterstykkeNavn) VALUES (?, ?, ?)", (BillettID, dato , TeaterstykkeNavn) )
        c.execute("INSERT INTO Billettkjøp(BillettID, SamlekjøpID) VALUES (?, ?)", (BillettID, kundeID))
    
    


solgt_seter, sal, dato = registrert_solge_seter('gamle-scene.txt')
solgt_seter1, sal, dato = registrert_solge_seter('hovedscenen.txt')

Registrer_Billett(solgt_seter, sal, dato, 1)
Registrer_Billett(solgt_seter1, sal, dato, 2)
print("Billetter registrert")

conn.commit()