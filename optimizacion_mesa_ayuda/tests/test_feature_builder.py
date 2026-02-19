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
