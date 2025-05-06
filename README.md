
# Dashboard Power BI-Segmentation-RFM et comportement d'achat
📌 Objectif du projet :<br>
Ce projet vise à analyser le comportement des clients à partir de données transactionnelles, afin d’identifier les segments les plus rentables et d’orienter les décisions marketing (fidélisation, relance, ciblage, etc.)<br>

🧩 Données utilisées :<br>
Données de ventes e-commerce issues de kaggle : https://www.kaggle.com/datasets/thedevastator/online-retail-sales-and-customer-data/data <br>
Elles contiennent des informations sur : <i> Les clients - les transactions - dates de transactions...</bi><br>

🧠 Analyses réalisées :<br>
- Segmentation RFM (Récence, Fréquence, Montant) avec SQL puis intégrée dans Power BI.<br>
- Classification des clients par type de panier moyen (petit, moyen, élevé).<br>
- Identification des clients à forte valeur (top 5 par panier moyen).<br>
- Analyse de la répartition du CA net par segment RFM.<br>
- Nombre de clients par segment RFM et par panier moyen.<br>

📈 Principaux visuels :<br>
- Entonnoir : top 5 clients selon leur panier moyen.<br>
- Carte de KPI : nombre total de clients.<br>
- Tableau : nombre de clients et CA net selon le type de panier.<br>
- Graphique barres : nombre de clients par segment RFM.<br>
- Graphique barres : CA net généré par segment RFM.<br>

🧠 Insights clés :<br>
<b> Page 1 </b><br>
- Le panier moyen par clients est supérieur au panier moyen par transactions => <b> Cela suggère que les clients passent plusieurs transactions chacun (sinon, les deux paniers seraient similaires).</b><br>
- Hausse du nombre moyen de transactions par client => Un comportement d'achat positif.<br>
![p1](https://github.com/user-attachments/assets/457e25cf-1a69-46ab-86c7-61a11b6a1739)



<b>Page 2 </b><br>
- Volume fait la force : Les clients petits paniers sont nombreux, donc leur contribution est majeure.<br>
- Les clients à segment “à réactiver” ont prouvé qu’ils pouvaient rapporter beaucoup. Il faut donc les cibler en priorité avec des campagnes de réactivation !<br>
- Les clients premium sont peu nombreux mais à forte valeur unitaire.<br>
![p2](https://github.com/user-attachments/assets/5990fab5-82e4-4437-a1af-de8201a930de)



🛠️ Outils & technologies<br>
- SQL (BigQuery) :  nettoyage, EDA (analyse exploratoire), création des scores RFM et export des résultats vers Power BI.<br>
- Power BI : pour la modélisation et la visualisation des données.<br>

🗒️ Phases du projet :<br>
**1- Prétraitement des données :** <br>
Les données ont été analysées et nettoyées dans BigQuery :<br>
- Analyse exploratoire et nettoyage des données (dates, valeurs aberrantes, doublons).<br>
- Calcul des indicateurs Récence, Fréquence et Montant pour chaque client.<br>
- Attribution des scores RFM selon des règles de segmentation.<br>
- Export de la table finale vers Power BI pour modélisation.<br>

**2- Modélisation et visualisation des données :**<br>
- Création du modèle de données.<br>
- Calcul de KPIs (panier moyen, CA net, nombre de clients…).<br>
- Conception de deux pages de dashboard (segmentation client, comportement d’achat). <br>

🎯 Conclusion : <br>
Ce projet m’a permis de mettre en pratique l’analyse RFM combinée à Power BI pour explorer le comportement d’achat client. Il met en avant l’intérêt de croiser plusieurs indicateurs pour orienter les décisions marketing.  
