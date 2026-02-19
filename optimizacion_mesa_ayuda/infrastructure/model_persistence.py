import joblib


class ModelPersistence:

    def save(self, model, path="artifacts/models/model.pkl"):
        joblib.dump(model, path)

    def load(self, path="artifacts/models/model.pkl"):
        return joblib.load(path)
