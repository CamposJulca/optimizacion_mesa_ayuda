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
