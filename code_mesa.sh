#!/bin/bash

echo "🧠 Generando código base completo..."

PROJECT="optimizacion_mesa_ayuda"

# =========================
# main.py
# =========================
cat <<EOF > $PROJECT/main.py
from application.pipeline import DataPipeline
from application.trainer import ModelTrainer
from application.evaluator import ModelEvaluator


def main():
    print("🚀 Iniciando proceso de optimización...")

    pipeline = DataPipeline()
    df = pipeline.run()

    trainer = ModelTrainer()
    model, X_test, y_test = trainer.train(df)

    evaluator = ModelEvaluator()
    evaluator.evaluate(model, X_test, y_test)

    print("✅ Proceso finalizado.")


if __name__ == "__main__":
    main()
EOF

# =========================
# config/settings.py
# =========================
cat <<EOF > $PROJECT/config/settings.py
import os

DB_CONFIG = {
    "driver": "{ODBC Driver 17 for SQL Server}",
    "server": os.getenv("DB_SERVER", "localhost"),
    "database": os.getenv("DB_NAME", "test_db"),
    "username": os.getenv("DB_USER", "user"),
    "password": os.getenv("DB_PASSWORD", "password"),
}
EOF

# =========================
# presentation/cli.py
# =========================
cat <<EOF > $PROJECT/presentation/cli.py
def show_banner():
    print("="*50)
    print(" OPTIMIZACION MESA DE AYUDA ")
    print("="*50)
EOF

# =========================
# application/pipeline.py
# =========================
cat <<EOF > $PROJECT/application/pipeline.py
import pandas as pd
from domain.transformations import DataCleaner
from domain.feature_builder import FeatureBuilder


class DataPipeline:

    def __init__(self):
        self.cleaner = DataCleaner()
        self.builder = FeatureBuilder()

    def extract(self):
        # Mock temporal hasta conexión real
        data = {
            "feature1": [1, 2, 3, 4],
            "feature2": [10, 20, 30, 40],
            "target": [15, 25, 35, 45]
        }
        return pd.DataFrame(data)

    def transform(self, df):
        df = self.cleaner.clean(df)
        df = self.builder.build_features(df)
        return df

    def run(self):
        df = self.extract()
        df = self.transform(df)
        return df
EOF

# =========================
# application/trainer.py
# =========================
cat <<EOF > $PROJECT/application/trainer.py
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression


class ModelTrainer:

    def train(self, df):
        X = df.drop("target", axis=1)
        y = df["target"]

        X_train, X_test, y_train, y_test = train_test_split(
            X, y, test_size=0.25, random_state=42
        )

        model = LinearRegression()
        model.fit(X_train, y_train)

        return model, X_test, y_test
EOF

# =========================
# application/evaluator.py
# =========================
cat <<EOF > $PROJECT/application/evaluator.py
from sklearn.metrics import r2_score, mean_squared_error


class ModelEvaluator:

    def evaluate(self, model, X_test, y_test):
        predictions = model.predict(X_test)

        r2 = r2_score(y_test, predictions)
        mse = mean_squared_error(y_test, predictions)

        print(f"R2 Score: {r2:.4f}")
        print(f"MSE: {mse:.4f}")
EOF

# =========================
# domain/transformations.py
# =========================
cat <<EOF > $PROJECT/domain/transformations.py
import re
from unidecode import unidecode
import pandas as pd


class DataCleaner:

    def clean(self, df: pd.DataFrame) -> pd.DataFrame:
        df = df.dropna()
        df = df.reset_index(drop=True)
        return df

    def normalize_text(self, text: str) -> str:
        text = text.lower()
        text = unidecode(text)
        text = re.sub(r'[^a-z0-9\\s]', '', text)
        text = re.sub(r'\\s+', ' ', text).strip()
        return text
EOF

# =========================
# domain/feature_builder.py
# =========================
cat <<EOF > $PROJECT/domain/feature_builder.py
class FeatureBuilder:

    def build_features(self, df):
        # Ejemplo: feature derivada
        df["feature_sum"] = df["feature1"] + df["feature2"]
        return df
EOF

# =========================
# domain/metrics.py
# =========================
cat <<EOF > $PROJECT/domain/metrics.py
def calculate_basic_metrics(y_true, y_pred):
    from sklearn.metrics import r2_score, mean_absolute_error
    return {
        "r2": r2_score(y_true, y_pred),
        "mae": mean_absolute_error(y_true, y_pred)
    }
EOF

# =========================
# infrastructure/db_connection.py
# =========================
cat <<EOF > $PROJECT/infrastructure/db_connection.py
import pyodbc
from config.settings import DB_CONFIG


class DatabaseConnection:

    def connect(self):
        conn_str = (
            f"DRIVER={DB_CONFIG['driver']};"
            f"SERVER={DB_CONFIG['server']};"
            f"DATABASE={DB_CONFIG['database']};"
            f"UID={DB_CONFIG['username']};"
            f"PWD={DB_CONFIG['password']}"
        )
        return pyodbc.connect(conn_str)
EOF

# =========================
# infrastructure/repositories.py
# =========================
cat <<EOF > $PROJECT/infrastructure/repositories.py
class QueryRepository:

    def get_base_query(self):
        return "SELECT * FROM tabla_incidentes"
EOF

# =========================
# infrastructure/model_persistence.py
# =========================
cat <<EOF > $PROJECT/infrastructure/model_persistence.py
import joblib


class ModelPersistence:

    def save(self, model, path="artifacts/models/model.pkl"):
        joblib.dump(model, path)

    def load(self, path="artifacts/models/model.pkl"):
        return joblib.load(path)
EOF

# =========================
# tests/test_transformations.py
# =========================
cat <<EOF > $PROJECT/tests/test_transformations.py
import pandas as pd
from domain.transformations import DataCleaner


def test_clean_removes_nulls():
    cleaner = DataCleaner()

    df = pd.DataFrame({
        "a": [1, 2, None],
        "b": [4, None, 6]
    })

    result = cleaner.clean(df)

    assert result.isnull().sum().sum() == 0
EOF

echo "✅ Código base generado correctamente."
