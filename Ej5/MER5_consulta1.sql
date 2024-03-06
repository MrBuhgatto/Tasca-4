use MER5;
SELECT Client.nom, Vehicle.marca, Tipus_vehicle.nom, Cita.data, Cita.ubicacio, Client_vehicle.data_inici, Client_vehicle.data_final
FROM Client, Vehicle, Tipus_vehicle, Cita, Client_vehicle
WHERE Client.DNI = Client_vehicle.client_DNI and
	Vehicle.num_serie =Client_vehicle.Vehicle_ID1 AND
	Tipus_vehicle_ID = Vehicle.Tipus_vehicle_ID AND
	Client_vehicle.Vehicle_ID1= Cita.Vehicle_ID AND
    Cita.data>"2024-1-31";