from domain.metrics import calculate_basic_metrics


def test_metrics_calculation():
    y_true = [10, 20, 30]
    y_pred = [12, 19, 29]

    metrics = calculate_basic_metrics(y_true, y_pred)

    assert "r2" in metrics
    assert "mae" in metrics
