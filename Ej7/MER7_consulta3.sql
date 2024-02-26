use MER7;
select count(*)
from Linia_ticket, Ticket, Empleat
where Ticket.num = Linia_ticket.ID AND
Empleat.ID=Ticket.Empleat_ID AND
Empleat LIKE "0%";
