CREATE OR REPLACE TABLE `profil-client-projet.profil_client.Retour_VS_Vente` AS
WITH ventes AS(
  SELECT CustomerID,
  COUNT(InvoiceNo) AS Nbre_cmd,
  SUM(ROUND((Quantity * UnitPrice), 0)) AS CA_cmd
  FROM `profil-client-projet.profil_client.ventes`
  WHERE NOT STARTS_WITH(InvoiceNo, 'C') AND CustomerID IS NOT NULL
  GROUP BY CustomerID
),
retours AS(
  SELECT CustomerID,
  COUNT(InvoiceNo) AS Nbre_retour,
  SUM(ROUND((Quantity * UnitPrice), 0)) AS CA_retour
  FROM `profil-client-projet.profil_client.ventes`
  WHERE STARTS_WITH(InvoiceNo, 'C') AND CustomerID IS NOT NULL
  GROUP BY CustomerID
),
final AS(
  SELECT 
  v.CustomerID,
  v.Nbre_cmd,
  v.CA_cmd,
  ABS(ROUND((v.CA_cmd -  IFNULL(r.CA_retour, 0)), 0)) AS CA_net,
  IFNULL(r.Nbre_retour, 0) AS nbr_retour,
  IFNULL(r.CA_retour, 0) AS CA_retour,
  SAFE_DIVIDE(IFNULL(r.Nbre_retour,0) , v.Nbre_cmd) AS taux_retour,
  SAFE_DIVIDE(IFNULL(r.CA_retour, 0) , v.CA_cmd) AS taux_CA_retour
 FROM ventes v LEFT JOIN retours r ON v.CustomerID = r.CustomerID
)
SELECT * FROM final;