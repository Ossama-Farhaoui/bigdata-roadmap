import pandas as pd

# Lire le fichier CSV
df = pd.read_csv("olist_orders_dataset.csv")

# Afficher les 5 premières lignes
print(df.head())

# Afficher les informations générales
print(df.info())

# Afficher les statistiques
print(df.describe())

# Vérifier les valeurs manquantes
print(df.isnull().sum())

print("\nColonnes avec valeurs manquantes :")
print(df.isnull().sum())

# Supprimer les lignes où la date de livraison client est manquante
df_clean = df.dropna(subset=["order_delivered_customer_date"])

print("\nAprès suppression des NULL :")
print(df_clean.isnull().sum())

# Convertir les colonnes de dates en datetime
df_clean["order_purchase_timestamp"] = pd.to_datetime(df_clean["order_purchase_timestamp"])
df_clean["order_delivered_customer_date"] = pd.to_datetime(df_clean["order_delivered_customer_date"])

print("\nTypes après conversion :")
print(df_clean.dtypes)