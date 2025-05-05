SELECT 
  column_name, 
  data_type 
FROM `profil-client-projet.profil_client.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'ventes';

SELECT
  COUNTIF(index IS NULL) AS null_index,
  COUNTIF(InvoiceNo IS NULL) AS null_invoiceNo,
  COUNTIF(StockCode IS NULL) AS null_StockCode,
  COUNTIF(Description IS NULL) AS null_description,
  COUNTIF(Quantity IS NULL) AS null_quantity,
  COUNTIF(InvoiceDate IS NULL) AS null_invoiceDate,
  COUNTIF(UnitPrice IS NULL) AS null_unitPrice,
  COUNTIF(CustomerID IS NULL) AS null_customerID,
  COUNTIF(Country IS NULL) AS null_country
FROM `profil-client-projet.profil_client.ventes`;

DELETE FROM `profil-client-projet.profil_client.ventes` WHERE CustomerID IS NULL;
DELETE FROM `profil-client-projet.profil_client.ventes` WHERE UnitPrice = 0.0;

SELECT
  MIN(UnitPrice) AS minPrice,
  MAX(UnitPrice) AS maxPrice 
FROM 
`profil-client-projet.profil_client.ventes`;

SELECT MIN(Quantity)AS Min_qte,
  MAX(Quantity) AS Max_qte,
  AVG(Quantity) AS Avg_qte
FROM 
`profil-client-projet.profil_client.ventes`;

SELECT 
 COUNT(DISTINCT CustomerID) AS nbre_client
FROM
`profil-client-projet.profil_client.ventes`; 

SELECT 
  COUNT(Description) 
FROM `profil-client-projet.profil_client.ventes`;

SELECT *
 FROM 
  `profil-client-projet.profil_client.ventes` 
WHERE Quantity<0 ORDER BY Quantity;

SELECT 
 COUNT(*) 
FROM
 `profil-client-projet.profil_client.ventes` 
WHERE 
  Quantity<0;

SELECT * FROM `profil-client-projet.profil_client.ventes` WHERE Quantity IN (74215, 80995);

SELECT * FROM `profil-client-projet.profil_client.ventes` WHERE Quantity>80000;

SELECT *,
  CASE 
    WHEN STARTS_WITH(InvoiceNo, 'C') THEN 'Retour'
    ELSE 'Vente'
  END AS Type_Transaction
FROM `profil-client-projet.profil_client.ventes`;

SELECT COUNT(InvoiceNo) AS Nbre_cmd_retournees FROM `profil-client-projet.profil_client.ventes` WHERE InvoiceNo LIKE 'C%';

SELECT COUNT(DISTINCT StockCode) FROM `profil-client-projet.profil_client.ventes`;

SELECT InvoiceNo, COUNT(*) AS n
FROM `profil-client-projet.profil_client.ventes`
GROUP BY(InvoiceNo)
HAVING n>1 ORDER BY n DESC;