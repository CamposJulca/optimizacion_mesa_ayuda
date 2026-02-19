#!/bin/bash

echo "🧪 Generando pruebas unitarias completas..."

PROJECT="optimizacion_mesa_ayuda"
TEST_DIR="$PROJECT/tests"

mkdir -p $TEST_DIR

# =========================
# test_transformations.py
# =========================
cat <<EOF > $TEST_DIR/test_transformations.py
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
    assert len(result) == 1


def test_normalize_text():
    cleaner = DataCleaner()

    text = "Árbol!!!   Tecnología 2026 🚀"
    result = cleaner.normalize_text(text)

    assert result == "arbol tecnologia 2026"
EOF

# =========================
# test_feature_builder.py
# =========================
cat <<EOF > $TEST_DIR/test_feature_builder.py
import pandas as pd
from domain.feature_builder import FeatureBuilder


def test_build_features_creates_feature_sum():
    builder = FeatureBuilder()

    df = pd.DataFrame({
        "feature1": [1, 2],
        "feature2": [10, 20]
    })

    result = builder.build_features(df)

    assert "feature_sum" in result.columns
    assert result["feature_sum"].tolist() == [11, 22]
EOF

# =========================
# test_trainer.py
# =========================
cat <<EOF > $TEST_DIR/test_trainer.py
import pandas as pd
from application.trainer import ModelTrainer


def test_model_trains_successfully():
    trainer = ModelTrainer()

    df = pd.DataFrame({
        "feature1": [1, 2, 3, 4],
        "feature2": [10, 20, 30, 40],
        "target": [15, 25, 35, 45]
    })

    model, X_test, y_test = trainer.train(df)

    assert model is not None
    assert len(X_test) > 0
    assert len(y_test) > 0
EOF

# =========================
# test_metrics.py
# =========================
cat <<EOF > $TEST_DIR/test_metrics.py
from domain.metrics import calculate_basic_metrics


def test_metrics_calculation():
    y_true = [10, 20, 30]
    y_pred = [12, 19, 29]

    metrics = calculate_basic_metrics(y_true, y_pred)

    assert "r2" in metrics
    assert "mae" in metrics
EOF

echo "✅ Pruebas unitarias generadas correctamente."
