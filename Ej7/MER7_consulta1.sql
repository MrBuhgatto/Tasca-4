use MER7;
select Producte.nom, Producte.descripcio, Producte.IVA, Producte.preu_unitari
FROM Producte
where Producte.IVA="10%";