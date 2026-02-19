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
