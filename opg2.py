import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('my_database.db')

# Create a cursor object
c = conn.cursor()

# Insert a row of data
c.execute("INSERT INTO Kunde(KundeID, Mobilnr, Navn, Adresse) VALUES (1, '97156483', 'Renegade Raider', 'Pleasant Park 1a')")

with open('gamle-scene.txt', 'r') as fd:
    # date = next(fd).strip()  # The first line is the date
    section = None
    for myline in fd:
        myline = myline.strip()
        if 'Dato' in myline:
            words = myline.split()
            for word in words:
                if len(word) == 10 and word[4] == "-" and word[7] == "-":
                    dato = word
        if myline in ['Galleri', 'Balkong', 'Parkett']:
            section = myline  # This line is a section name
        elif myline.isdigit():
            # This line is a row of seats
            seats = myline
            # Construct the SQL query
            sql_query = "INSERT INTO Seats(Date, Section, Seats) VALUES (?, ?, ?)"
            # Execute the SQL command
            c.execute(sql_query, (dato, section, seats))

# Commit the changes
conn.commit()

# Close the connection
conn.close()