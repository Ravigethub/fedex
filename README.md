🚚 FedEx Shipment Delay Prediction using Machine Learning
📌 Problem Statement

We aim to predict shipment delivery status (On-Time / Delayed / Other) based on FedEx shipment data, including distance, planned vs. actual times, carrier details, and source/destination hubs.
Additionally, we perform network analytics to study connectivity between shipment hubs and identify critical nodes in the FedEx logistics network.

| Feature                   | Type        | Description                                        
| ------------------------- | ----------- | -------------------------------------------------- 
| Shipment\_Delay           | Continuous  | Delay in shipment (in hours/days)                  
| Actual\_Shipment\_Time    | Continuous  | Actual time taken for dispatch (hours)             
| Delivery\_Status (Target) | Categorical | Final delivery status → On-Time / Delayed / Others 
| Distance                  | Continuous  | Distance between source and destination (km/miles) 
| Source                    | Categorical | Origin hub/city                                    
| Destination               | Categorical | Destination hub/city                               
| Carrier\_Name             | Categorical | Carrier company handling the shipment              
| Carrier\_Num              | Categorical | Carrier ID/number                                  
| Planned\_TimeofTravel     | Continuous  | Expected travel time (hours)                       
| Planned\_Shipment\_Time   | Continuous  | Scheduled shipment time                            
| Planned\_Delivery\_Time   | Continuous  | Scheduled delivery time                            



****

**Data Preprocessing
**
Removed duplicates

Checked for null/NaN values and imputed:

Mean → numerical features

Mode → categorical features

Outliers detected via boxplots → handled with Winsorization (IQR method)

Label Encoding applied to categorical columns (Source, Destination, Carrier_Name)

Features scaled using StandardScaler

Train-test split: 70% training / 30% testing

📈 Exploratory Data Analysis (EDA)

Univariate Analysis:

Countplot for delivery status distribution

Boxplots for outlier detection (Distance, Shipment_Delay, Travel Times)

Bivariate Analysis:

Correlation heatmap → found strong relation between planned vs actual times & delivery delays

Insights:

Most delays occurred on longer distances

Some carriers had consistently higher delays than others

Source–Destination pairs influence reliability

Model Building
1️⃣ Decision Tree Classifier

Parameters: min_samples_split = 5

Training Accuracy: ~78%

Testing Accuracy: ~72%

2️⃣ Decision Tree + GridSearchCV

Tuned max_depth, min_samples_leaf, max_features

Best Accuracy:

Training: ~83%

Testing: ~76%

🌐 Network Analytics (using networkx)

Built shipment hub graph with Source → Destination as edges

Calculated:

Degree Centrality → identifies most connected hubs

Closeness Centrality → hubs closest to all others

Betweenness Centrality → critical hubs controlling flow

Eigenvector Centrality → influence of hubs

Clustering Coefficient → hub grouping strength

✅ Conclusion

Decision Tree with GridSearchCV performed best (~76% test accuracy)

Longer distances & higher shipment times → higher delays

Network analytics revealed key FedEx hubs that influence delivery performance

Can help FedEx optimize routes, carrier assignments, and resource allocation

💡 Benefits

Improves delivery reliability & customer satisfaction

Helps logistics managers identify delay-prone routes/hubs

Supports strategic planning in large supply chain networks

📌 Technologies Used

Python (Pandas, NumPy, Matplotlib, Seaborn)

Feature Engineering: Feature-Engine (Winsorizer)

Machine Learning: scikit-learn (DecisionTree, GridSearchCV, LabelEncoder, StandardScaler)

Network Analysis: NetworkX

Visualization: Matplotlib, Seaborn
