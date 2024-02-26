use MER4;
SELECT Client.nom as "Nom client", Client.cognom as "Cognom del client", Polissa.num_polissa as "Número de la pòlissa"
FROM Client, Polissa 
WHERE Client.DNI = Polissa.Client_DNI and Client.Nom = "Jordi";