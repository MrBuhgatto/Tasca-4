use MER6;
select Reserves.data, Reserves.import, Vols.num_vol, Passatgers.nom, Passatgers.cognom
FROM Reserves, Vols, Passatgers
WHERE Passatgers.ID=Reserves.Passatgers_ID and Vols.ID=Reserves.Vols_ID and Passatgers.nom="Pacheco";