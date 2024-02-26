use MER4;
SELECT Client.nom, Client.cognom, Venedor.nom, Venedor.cognom, Polissa.num_polissa, Tipus_Polissa.nom
FROM Client, Venedor, Polissa, Tipus_Polissa
WHERE Client.DNI = Polissa.client_DNI and Venedor.DNI = Polissa.Venedor_DNI and 
		Tipus_Polissa.ID = Polissa.Tipus_Polissa_ID;