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
