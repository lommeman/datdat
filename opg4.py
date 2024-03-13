import sqlite3

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

print_performances_on_date('2024-02-05')