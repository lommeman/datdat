SELECT 
    T.Navn AS Teaterstykke,
    ANS.Navn AS Skuespiller,
    GROUP_CONCAT(HR.Rollenavn, ', ') AS Roller
FROM 
    (SELECT DISTINCT 
        HR.AnsattID, 
        HR.Rollenavn, 
        HR.Teaterstykkenavn 
     FROM 
        HarRolle HR) AS HR
JOIN 
    Teaterstykke T ON HR.Teaterstykkenavn = T.Navn
JOIN 
    Ansatt ANS ON HR.AnsattID = ANS.AnsattID
GROUP BY 
    T.Navn,
    ANS.Navn;