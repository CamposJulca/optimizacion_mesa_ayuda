from sklearn.metrics import r2_score, mean_squared_error


class ModelEvaluator:

    def evaluate(self, model, X_test, y_test):
        predictions = model.predict(X_test)

        r2 = r2_score(y_test, predictions)
        mse = mean_squared_error(y_test, predictions)

        print(f"R2 Score: {r2:.4f}")
        print(f"MSE: {mse:.4f}")
