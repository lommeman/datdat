import sqlite3

conn = sqlite3.connect('new2.db')
c = conn.cursor()

#Antar her at vi bruker samme tekstfiler som i oppgave 2


def kjøp_billetter(filename, gruppe):
    with open(filename, 'r') as f:
        lines = f.readlines()
        dato = ''
        område = ''
        solgt_seter = []

        sal = 'Gamle scene'
        c.execute("SELECT Navn FROM Teaterstykke WHERE Salnavn = ?", (sal,))
        TeaterstykkeNavn = c.fetchone()[0]

        c.execute("SELECT Pris FROM Gruppe WHERE TeaterstykkeNavn = ? AND Gruppenavn = ?", (TeaterstykkeNavn, gruppe))
        pris = c.fetchone()[0]


        totalt_rader = sum(1 for line in lines 
                           if line.strip() 
                           not in ["Galleri", "Balkong", "Parkett"] 
                           and "Dato" not in line)
        
        rad_nr = totalt_rader
        antall_kjøpte_seter = 0

       

        for line in lines:
            if "Dato" in line: 
                words = line.split()
                for word in words:
                    if len(word) == 10 and word[4] == "-" and word[7] == "-":
                        dato =  word

            elif line.strip() in ["Galleri", "Balkong", "Parkett"]:
                område = line.strip()
                rad_nr = totalt_rader
            else:
                seter = list(line.strip())
                ledige_seter = []

                for i, sete in enumerate(seter):
                    if sete == '0':
                        ledige_seter.append(i)

                
                for i in ledige_seter:
                    if antall_kjøpte_seter < 9:
                        if i not in solgt_seter.append((i + 1, rad_nr, område))
                        antall_kjøpte_seter += 1
                        if antall_kjøpte_seter == 9:
                            break
            rad_nr -= 1
        
            if antall_kjøpte_seter == 9:
                break

        sum_kostnad = len(solgt_seter) * pris
        return solgt_seter, sal, dato, sum_kostnad
    
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
        c.execute("INSERT INTO Kunde(kundeID, Mobilnr, Navn, Adresse) VALUES (3, '92696433', 'Pit Bull', 'Dæælhin blv')")


    if not check_samlekjop_exists(1):
        c.execute("INSERT INTO Samlekjøp(SamlekjøpID, KundeID, Dato, Tid) VALUES (3, 3, '2024-01-01', '23:59')")
   
    
    c.execute("SELECT MAX(BillettID) FROM Billett")
    result = c.fetchone()
    BillettID = result[0] if result[0] is not None else 0

    for sete in solgt_seter:
        BillettID += 1
        c.execute("INSERT INTO Billett(BillettID, Setenr, Radnr, OmrådeNavn) VALUES (?, ?, ?, ?)", (BillettID,) + sete)
        c.execute("INSERT INTO BillettSolgtTilForestilling(BillettID, ForestillingDato, TeaterstykkeNavn) VALUES (?, ?, ?)", (BillettID, dato , TeaterstykkeNavn) )
        c.execute("INSERT INTO Billettkjøp(BillettID, SamlekjøpID) VALUES (?, ?)", (BillettID, kundeID))
    
    


solgt_seter_kjærligheten, sal_kjærligheten, dato_kjærligheten, sum_kostnad = kjøp_billetter('gamle-scene.txt', 'Ordinær')


Registrer_Billett(solgt_seter_kjærligheten, sal_kjærligheten, dato_kjærligheten, 3)


def print_table_data(c, table_name):
    c.execute(f"SELECT * FROM {table_name}")
    rows = c.fetchall()
    print(f"Data from {table_name}:")
    for row in rows:
        print(row)

# After committing the transaction
conn.commit()

# Print data from tables
print("Total pris for billettene blir:", sum_kostnad)
print_table_data(c, "Billett")
print_table_data(c, "BillettSolgtTilForestilling")
print_table_data(c, "Billettkjøp")


