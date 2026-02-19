import re
from unidecode import unidecode
import pandas as pd


class DataCleaner:

    def clean(self, df: pd.DataFrame) -> pd.DataFrame:
        df = df.dropna()
        df = df.reset_index(drop=True)
        return df

    def normalize_text(self, text: str) -> str:
        text = text.lower()
        text = unidecode(text)
        text = re.sub(r'[^a-z0-9\s]', '', text)
        text = re.sub(r'\s+', ' ', text).strip()
        return text
