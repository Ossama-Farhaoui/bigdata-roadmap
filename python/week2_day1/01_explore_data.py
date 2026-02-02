import pandas as pd

# Lire le fichier CSV
df = pd.read_csv("olist_orders_dataset.csv")

print(df.head())
print(df.info())
print(df.describe())
print(df.isnull().sum())

# ===== NETTOYAGE (Jour 2) =====
df_clean = df.dropna(subset=["order_delivered_customer_date"])

df_clean["order_purchase_timestamp"] = pd.to_datetime(df_clean["order_purchase_timestamp"])
df_clean["order_delivered_customer_date"] = pd.to_datetime(df_clean["order_delivered_customer_date"])

print(df_clean.dtypes)

# ===== NOUVEAU CODE (Jour 3) =====
df_clean["delivery_delay_days"] = (
    df_clean["order_delivered_customer_date"] -
    df_clean["order_purchase_timestamp"]
).dt.days

print("\nDélai de livraison (5 premières lignes) :")
print(df_clean[["order_id", "delivery_delay_days"]].head())

print("\nStatistiques du délai de livraison :")
print(df_clean["delivery_delay_days"].describe())
