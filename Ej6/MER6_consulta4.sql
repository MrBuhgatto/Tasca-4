use MER6;
SELECT Reserves.data, Reserves.import, Vols.num_vol, Passatgers.nom, Passatgers.cognom
FROM Reserves, Vols, Passatgers
WHERE Passatgers.ID=Reserves.Passatgers_ID and Vols.ID=Reserves.Vols_ID and Vols.data_sortida="2024-02-16";