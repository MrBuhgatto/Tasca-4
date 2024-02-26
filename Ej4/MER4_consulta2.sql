use MER4;
SELECT Polissa.num_polissa as "Número de la polissa", Tipus_Polissa.Nom as "Nom Pòlissa",
		Client.DNI, Client.nom as "Nom client", Client.cognom as "Cognom del client"
FROM Client, Polissa, Tipus_Polissa
WHERE Client.DNI = Polissa.client_DNI and
		Tipus_Polissa.ID = Polissa.Tipus_Polissa_ID and
        Tipus_Polissa.Nom = "Viatge";