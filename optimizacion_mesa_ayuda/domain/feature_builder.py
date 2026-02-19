class FeatureBuilder:

    def build_features(self, df):
        # Ejemplo: feature derivada
        df["feature_sum"] = df["feature1"] + df["feature2"]
        return df
