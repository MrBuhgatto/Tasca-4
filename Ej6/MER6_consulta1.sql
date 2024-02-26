use MER6;
SELECT Passatgers.DNI, Passatgers.nom, Passatgers.cognom, Vols.num_vol, Vols.origen, Vols.desti, Reserves.import
FROM Passatgers, Vols, Reserves
WHERE Passatgers.ID=Reserves.Passatgers_ID and Vols.ID=Reserves.Vols_ID;