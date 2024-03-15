# Datamodellering og databasesystemer
Lars Hammernes Leopold, Rory Fitzgerald og Marius Jullum Faanes

Vi har delt inn alle oppgavene i separate filer.
Å kjøre dem i stigende rekkefølge vil gi best resultat, men noen av oppgavene kan jo selvsagt kjøres når som helst.

Del1.sql oppretter tabellene, så den må kjøres først uansett.

Det skal nå være mulig å kjøre all koden fra terminal, slik som beskrevet i tips.txt.

Databasefilen er tom og heter 'TeaterDB.db'.

opg1, opg5 og opg6 er sql files som kjøres inne i databasen med sqlite3 TeaterDB.db, etterfulgt av .read opg1.sql, .read opg5.sql og .read opg6.sql.
opg2, opg3, opg4 og opg7 er python script, hvor opg2 kjøres med inputargument "hovedscenen.txt" eller "gamle-scene.txt", opg3 har ingen inputargument, opg4 kjøres med dato som inputargument i formatet "YYYY-MM-DD" og opg7 kjøres med skuespillernavn som inputargument.

Eksempel:
python opg2.py "hovedscenen.txt"
python opg3.py
python opg4.py "2024-02-03"
python opg7.py "Arturo Scotti"