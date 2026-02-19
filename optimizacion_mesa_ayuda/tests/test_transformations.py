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
