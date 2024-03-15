import sqlite3
import argparse
from datetime import datetime

conn = sqlite3.connect('TeaterDB.db')
c = conn.cursor()

def registrert_solge_seter(filename):
    with open(filename, 'r') as f:
        lines = f.readlines()
        dato = ''
        område = ''
        solgt_seter = []

        områder = set(line.strip() for line in lines if line.strip() in ["Galleri", "Balkong", "Parkett"])
        sal = 'Hovedscenen' if 'Parkett' in områder and 'Galleri' in områder and 'Balkong' not in områder else 'Gamle scene'

        område_rader = {"Galleri": [], "Balkong": [], "Parkett": []}
        current_område = None

        for line in lines:
            if "Dato" in line: 
                words = line.split()
                for word in words:
                    if len(word) == 10 and word[4] == "-" and word[7] == "-":
                        dato =  word

            elif line.strip() in ["Galleri", "Balkong", "Parkett"]:
                current_område = line.strip()
                
            else:
                område_rader[current_område].append(line.strip())

        solgt_seter = []
        for område, rader in område_rader.items():
            for rad_nr, rad in enumerate(reversed(rader), start=1):
                for sete_nr, sete in enumerate(rad, start=1):
                    if sete == '1':
                        område_Galleri = ''
                        if område == 'Galleri' and sal == 'Hovedscenen':
                            if rad_nr == 1 or rad_nr == 2:  
                                område_Galleri = 'Nedre'
                            elif rad_nr == 3 or rad_nr == 4: 
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

    now = datetime.now()
 
    current_date = now.strftime("%Y-%m-%d")
    current_time = now.strftime("%H:%M")
   
    c.execute("SELECT MAX(BillettID) FROM Billett")
    result = c.fetchone()
    BillettID = result[0] if result[0] is not None else 0

    for sete in solgt_seter:
        BillettID += 1
        c.execute("INSERT INTO Billett(BillettID, Setenr, Radnr, OmrådeNavn) VALUES (?, ?, ?, ?)", (BillettID,) + sete)
        c.execute("INSERT INTO BillettSolgtTilForestilling(BillettID, ForestillingDato, TeaterstykkeNavn) VALUES (?, ?, ?)", (BillettID, dato , TeaterstykkeNavn) )
        c.execute("INSERT INTO Billettkjøp(BillettID, SamlekjøpID) VALUES (?, ?)", (BillettID, kundeID))

    c.execute(f"""
    INSERT INTO Samlekjøp(SamlekjøpID, KundeID, Dato, Tid) 
    VALUES ((SELECT MAX(SamlekjøpID) + 1 FROM Samlekjøp), '{kundeID}', '{current_date}', '{current_time}')
    """)

def print_table_data(c, table_name):
    c.execute(f"SELECT * FROM {table_name}")
    rows = c.fetchall()
    print(f"Data from {table_name}:")
    for row in rows:
        print(row)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Les inn solgte billetter fra fil og registrer dem i databasen.')
    parser.add_argument('filename', type=str, help='Fil som inneholder informasjon om solgte seter.')
    args = parser.parse_args()

    solgt_seter, sal, dato = registrert_solge_seter(args.filename)
    Registrer_Billett(solgt_seter, sal, dato, 1)

    conn.commit()

    print_table_data(c, "Billett")
    print_table_data(c, "BillettSolgtTilForestilling")
    print_table_data(c, "Billettkjøp")

