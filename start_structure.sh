#!/bin/bash

echo "🚀 Creando estructura del proyecto optimizacion_mesa_ayuda..."

PROJECT_ROOT="optimizacion_mesa_ayuda"

# Crear carpeta raíz si no existe
mkdir -p $PROJECT_ROOT
cd $PROJECT_ROOT || exit

# ==============================
# Crear directorios principales
# ==============================

mkdir -p config
mkdir -p presentation
mkdir -p application
mkdir -p domain
mkdir -p infrastructure
mkdir -p artifacts/models
mkdir -p artifacts/reports
mkdir -p tests

# ==============================
# Crear archivos principales
# ==============================

touch main.py

# Config
touch config/settings.py
touch config/__init__.py

# Presentation
touch presentation/cli.py
touch presentation/__init__.py

# Application
touch application/pipeline.py
touch application/trainer.py
touch application/evaluator.py
touch application/__init__.py

# Domain
touch domain/transformations.py
touch domain/feature_builder.py
touch domain/metrics.py
touch domain/__init__.py

# Infrastructure
touch infrastructure/db_connection.py
touch infrastructure/repositories.py
touch infrastructure/model_persistence.py
touch infrastructure/__init__.py

# Tests
touch tests/__init__.py

# ==============================
# Crear archivo requirements
# ==============================

touch requirements.txt
touch .gitignore
touch README.md

echo "✅ Estructura creada correctamente."
echo "📂 Ubicación: $(pwd)"
