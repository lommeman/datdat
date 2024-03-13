SELECT Forestilling.TeaterstykkeNavn, Forestilling.Dato, COUNT(BillettSolgtTilForestilling.BillettID) as SolgtePlasser
FROM Forestilling
LEFT JOIN BillettSolgtTilForestilling ON Forestilling.TeaterstykkeNavn = BillettSolgtTilForestilling.TeaterstykkeNavn AND Forestilling.Dato = BillettSolgtTilForestilling.ForestillingDato
GROUP BY Forestilling.TeaterstykkeNavn, Forestilling.Dato
ORDER BY SolgtePlasser DESC;