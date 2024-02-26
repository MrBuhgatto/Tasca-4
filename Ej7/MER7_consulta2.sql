use MER7;
select Ticket.num_factura, Ticket.data, Empleat.nom, Empleat.cognom
FROM Ticket, Empleat, Producte, Linia_ticket
WHERE Producte.ID = Linia_ticket.Producte_ID AND 
Ticket.num = Linia_ticket.Ticket_num AND 
Empleat.ID = Ticket.num AND 
Producte.nom="Poma";