SELECT Teaterstykkenavn, Navn, GROUP_CONCAT(Rollenavn, ', ') as Roller
FROM (
    SELECT DISTINCT H.Teaterstykkenavn, A.Navn, H.Rollenavn
    FROM HarRolle H
    JOIN Ansatt A ON H.AnsattID = A.AnsattID
) 
GROUP BY Teaterstykkenavn, Navn;