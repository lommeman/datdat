import sqlite3
import argparse

def print_actors_played_with(actor_name):
    conn = sqlite3.connect('TeaterDB.db')
    c = conn.cursor()

    c.execute("""
        SELECT DISTINCT A2.Navn, H2.Teaterstykkenavn
        FROM HarRolle H1
        JOIN Ansatt A1 ON H1.AnsattID = A1.AnsattID
        JOIN HarRolle H2 ON H1.Aktnr = H2.Aktnr AND H1.Teaterstykkenavn = H2.Teaterstykkenavn
        JOIN Ansatt A2 ON H2.AnsattID = A2.AnsattID
        WHERE A1.Navn = ? AND A1.Navn != A2.Navn
    """, (actor_name,))

    print(actor_name + " har spilt sammen med:")
    for row in c.fetchall():
        print(f"{row[0]} i {row[1]}")

    conn.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Finn skuespillere som har spilt sammen med en annen skuespiller.')
    parser.add_argument('actor_name', type=str, help='Navnet på skuespilleren du vil finne medspillere for.')
    args = parser.parse_args()
    print_actors_played_with(args.actor_name)