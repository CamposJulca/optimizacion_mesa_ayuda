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
