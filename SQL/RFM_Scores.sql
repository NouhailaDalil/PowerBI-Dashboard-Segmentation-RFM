CREATE OR REPLACE TABLE `profil-client-projet.profil_client.rfm_scores` AS
WITH base AS(
  SELECT *, 
    -- Recency : plus petit = meilleur
     NTILE(5) OVER (ORDER BY recency ASC) AS r_score,
     -- Frequency : plus grand = meilleur
     NTILE(5) OVER (ORDER BY frequency DESC) AS f_score,
     -- Monetary : plus grand = meilleur 
     NTILE(5) OVER (ORDER BY monetary DESC) AS m_score
  FROM `profil-client-projet.profil_client.rfm`
)
SELECT *,
    CONCAT(CAST(r_score AS STRING), CAST(f_score AS STRING), CAST(m_score AS STRING)) AS rfm_label,
  CASE
    WHEN r_score = 5 AND f_score = 5 AND m_score = 5 THEN 'Champions'
    WHEN r_score = 5 AND f_score >= 4 THEN 'Clients récents'
    WHEN f_score = 5 THEN 'Clients fréquents'
    WHEN m_score = 5 THEN 'Grands dépensiers'
    WHEN r_score <= 2 AND f_score <= 2 AND m_score <= 2 THEN 'À réactiver'
  ELSE 'Clients moyens'
      END AS rfm_segment
 FROM base;