DECLARE  @tmpDataTable Table (SrNo int, Scenario VarChar(10), LiveTable varchar(100), HistoryTable varchar(100), BiEntity varchar(100))
INSERT INTO @tmpDataTable values(1,'GL','GENERALJOURNALACCOUNTENTRY','GENERALJOURNALACCOUNTENTRYHISTORY','GeneraljournalaccountentryBiEntity')
INSERT INTO @tmpDataTable values(1,'GL','GENERALJOURNALACCOUNTENTRY_W','GENERALJOURNALACCOUNTENTRYHISTORY_W','GeneraljournalaccountentrywBiEntity')
INSERT INTO @tmpDataTable values(1,'GL','GENERALJOURNALENTRY','GENERALJOURNALENTRYHISTORY','GeneraljournalentryBiEntity')
INSERT INTO @tmpDataTable values(1,'GL','GENERALJOURNALENTRY_W','GENERALJOURNALENTRYHISTORY_W','GeneraljournalentrywBiEntity')
INSERT INTO @tmpDataTable values(1,'GL','LEDGERCONSOLIDATEHISTREF','LEDGERCONSOLIDATEHISTREFHISTORY','LedgerconsolidatehistrefBiEntity')
INSERT INTO @tmpDataTable values(1,'GL','LEDGERENTRY','LEDGERENTRYHISTORY','LedgerentryBiEntity')
INSERT INTO @tmpDataTable values(1,'GL','LEDGERENTRYJOURNAL','LEDGERENTRYJOURNALHISTORY','LedgerentryjournalBiEntity')
INSERT INTO @tmpDataTable values(1,'GL','LEDGERENTRYJOURNALIZING','LEDGERENTRYJOURNALIZINGHISTORY','LedgerentryjournalizingBiEntity')
INSERT INTO @tmpDataTable values(1,'GL','LEDGERTRANSSETTLEMENT','LEDGERTRANSSETTLEMENTHISTORY','LedgertranssettlementBiEntity')
INSERT INTO @tmpDataTable values(1,'GL','SUBLEDGERVOUCHERGENERALJOURNALENTRY','SUBLEDGERVOUCHERGENERALJOURNALENTRYHISTORY','SubledgervouchergeneraljournalentryBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','MCRRETURNSALESTABLE','MCRRETURNSALESTABLEHISTORY','McrreturnsalestableBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','MCRSALESLINE','MCRSALESLINEHISTORY','McrsaleslineBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','MCRSALESTABLE','MCRSALESTABLEHISTORY','McrsalestableBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','RETAILSALESLINE','RETAILSALESLINEHISTORY','RetailsaleslineBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','RETAILSALESTABLE','RETAILSALESTABLEHISTORY','RetailsalestableBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','SALESLINE','SALESLINEHISTORY','SaleslineBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','SALESLINE_BR','SALESLINEHISTORY_BR','SaleslinebrBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','SALESLINE_IN','SALESLINEHISTORY_IN','SaleslineinBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','SALESLINE_W','SALESLINEHISTORY_W','SaleslinewBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','SALESTABLE','SALESTABLEHISTORY','SalestableBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','SALESTABLE_BR','SALESTABLEHISTORY_BR','SalestablebrBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','SALESTABLE_RU','SALESTABLEHISTORY_RU','SalestableruBiEntity')
INSERT INTO @tmpDataTable values(2,'SO','SALESTABLE_W','SALESTABLEHISTORY_W','SalestablewBiEntity')
INSERT INTO @tmpDataTable values(3,'InvTrn','INVENTTRANSARCHIVE','INVENTTRANSARCHIVEHISTORY','InventtransarchiveBiEntity')
INSERT INTO @tmpDataTable values(3,'InvTrn','INVENTTRANS','INVENTTRANSARCHIVE','INVENTTRANSARCHIVEHISTORY,InventtransarchiveBiEntity')
--=====================================================================
--SELECT QUERY TO IDENTIFY SCHEMA MISMATCH
--=====================================================================
SELECT T.SrNo,T.Scenario, L.COLUMN_NAME,L.TABLE_NAME,HistoryTable,BiEntity--, *
FROM 
@tmpDataTable T 
	JOIN INFORMATION_SCHEMA.COLUMNS L ON T.LiveTable = L.TABLE_NAME
	LEFT OUTER JOIN INFORMATION_SCHEMA.COLUMNS H ON L.COLUMN_NAME = H.COLUMN_NAME AND  T.HistoryTable= H.TABLE_NAME 
WHERE --L.TABLE_NAME IN (N'SALESTABLE') AND 
H.COLUMN_NAME IS NULL
AND  L.COLUMN_NAME not in ('SYSDATASTATECODE','SYSROWVERSION')
Order by T.SrNo
--=====================================================================