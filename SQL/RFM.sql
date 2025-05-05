CREATE OR REPLACE TABLE `profil-client-projet.profil_client.rfm` AS
WITH rfm AS(
  SELECT 
  CAST(CustomerID AS INT64) AS CustomerID,
  COUNT(DISTINCT InvoiceNO) AS frequency,
  SUM(ROUND((Quantity * UnitPrice), 0)) AS monetary,
  DATE_DIFF(CURRENT_DATE(), MAX(DATE(InvoiceDate)), DAY) AS recency,
  MAX(DATE(InvoiceDate)) AS derniere_cmd,
  FROM `profil-client-projet.profil_client.ventes`
  WHERE CustomerID IS NOT NULL AND NOT STARTS_WITH(InvoiceNo, 'C')
  GROUP BY CustomerID
)
SELECT * FROM rfm;