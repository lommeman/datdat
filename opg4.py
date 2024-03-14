import sqlite3
import argparse

def print_performances_on_date(date):
    conn = sqlite3.connect('testing.db')
    c = conn.cursor()

    c.execute("""
        SELECT Forestilling.TeaterstykkeNavn, Forestilling.Dato, COUNT(BillettSolgtTilForestilling.BillettID)
        FROM Forestilling
        LEFT JOIN BillettSolgtTilForestilling ON Forestilling.TeaterstykkeNavn = BillettSolgtTilForestilling.TeaterstykkeNavn AND Forestilling.Dato = BillettSolgtTilForestilling.ForestillingDato
        WHERE Forestilling.Dato = ?
        GROUP BY Forestilling.TeaterstykkeNavn, Forestilling.Dato
    """, (date,))

    for row in c.fetchall():
        print(f"Teaterstykke: {row[0]}, Dato: {row[1]}, Billetter solgt: {row[2]}")

    conn.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Skriv ut forestillinger for en gitt dato.')
    parser.add_argument('date', type=str, help='Datoen du søker på i YYYY-MM-DD format.')
    args = parser.parse_args()
    print_performances_on_date(args.date)