import os

DB_CONFIG = {
    "driver": "{ODBC Driver 17 for SQL Server}",
    "server": os.getenv("DB_SERVER", "localhost"),
    "database": os.getenv("DB_NAME", "test_db"),
    "username": os.getenv("DB_USER", "user"),
    "password": os.getenv("DB_PASSWORD", "password"),
}
