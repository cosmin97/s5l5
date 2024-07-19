
-- 1. Conteggio dei verbali trascritti
SELECT COUNT(*) AS ConteggioVerbaliTrascritti FROM VERBALE;

-- 2. Conteggio dei verbali trascritti raggruppati per anagrafe
SELECT idanagrafica, COUNT(*) AS ConteggioVerbali FROM VERBALE GROUP BY idanagrafica;

-- 3. Conteggio dei verbali trascritti raggruppati per tipo di violazione
SELECT idviolazione, COUNT(*) AS ConteggioVerbali FROM VERBALE GROUP BY idviolazione;

-- 4. Totale dei punti decurtati per ogni anagrafe
SELECT idanagrafica, SUM(DecurtamentoPunti) AS TotalePuntiDecurtati FROM VERBALE GROUP BY idanagrafica;

-- 5. Cognome, Nome, Data violazione, Indirizzo violazione, importo e punti decurtati per tutti gli anagrafici residenti a Palermo
SELECT A.Cognome, A.Nome, V.DataViolazione, V.IndirizzoViolazione, V.Importo, V.DecurtamentoPunti
FROM VERBALE V
JOIN ANAGRAFICA A ON V.idanagrafica = A.idanagrafica
WHERE A.Citta = 'Palermo';

-- 6. Cognome, Nome, Indirizzo, Data violazione, importo e punti decurtati per le violazioni fatte tra il febbraio 2009 e luglio 2009
SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti
FROM VERBALE V
JOIN ANAGRAFICA A ON V.idanagrafica = A.idanagrafica
WHERE V.DataViolazione BETWEEN '2009-02-01' AND '2009-07-31';

-- 7. Totale degli importi per ogni anagrafico
SELECT idanagrafica, SUM(Importo) AS TotaleImporti FROM VERBALE GROUP BY idanagrafica;

-- 8. Visualizzazione di tutti gli anagrafici residenti a Palermo
SELECT * FROM ANAGRAFICA WHERE Citta = 'Palermo';

-- 9. Query che visualizzi Data violazione, Importo e decurtamento punti relativi ad una certa data
DECLARE @DataViolazione DATETIME = '2023-01-15';
SELECT DataViolazione, Importo, DecurtamentoPunti
FROM VERBALE
WHERE DataViolazione = @DataViolazione;

-- 10. Conteggio delle violazioni contestate raggruppate per Nominativo dell’agente di Polizia
SELECT Nominativo_Agente, COUNT(*) AS ConteggioViolazioni FROM VERBALE GROUP BY Nominativo_Agente;

-- 11. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino il decurtamento di 5 punti
SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti
FROM VERBALE V
JOIN ANAGRAFICA A ON V.idanagrafica = A.idanagrafica
WHERE V.DecurtamentoPunti > 5;

-- 12. Cognome, Nome, Indirizzo, Data violazione, Importo e punti decurtati per tutte le violazioni che superino l’importo di 400 euro
SELECT A.Cognome, A.Nome, A.Indirizzo, V.DataViolazione, V.Importo, V.DecurtamentoPunti
FROM VERBALE V
JOIN ANAGRAFICA A ON V.idanagrafica = A.idanagrafica
WHERE V.Importo > 400;
