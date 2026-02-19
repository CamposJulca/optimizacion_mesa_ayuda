#!/bin/bash

echo "🔧 Inicializando entorno virtual para optimizacion_mesa_ayuda..."

PROJECT_DIR="optimizacion_mesa_ayuda"
VENV_DIR="venv"

cd $PROJECT_DIR || exit

# Verificar que python3 existe
if ! command -v python3 &> /dev/null
then
    echo "❌ Python3 no está instalado."
    exit 1
fi

# Crear entorno virtual si no existe
if [ ! -d "$VENV_DIR" ]; then
    echo "📦 Creando entorno virtual..."
    python3 -m venv $VENV_DIR
else
    echo "ℹ️ El entorno virtual ya existe."
fi

# Activar entorno
echo "⚡ Activando entorno virtual..."
source $VENV_DIR/bin/activate

# Actualizar pip
echo "⬆️ Actualizando pip..."
pip install --upgrade pip

# Crear requirements.txt base si no existe
if [ ! -f "requirements.txt" ]; then
    touch requirements.txt
fi

echo "📚 Instalando dependencias base..."

pip install pandas
pip install numpy
pip install scikit-learn
pip install statsmodels
pip install matplotlib
pip install pyodbc
pip install unidecode
pip install pytest

echo "📄 Guardando dependencias en requirements.txt..."
pip freeze > requirements.txt

echo "✅ Entorno listo."
echo "Para activarlo manualmente en el futuro:"
echo "source $PROJECT_DIR/$VENV_DIR/bin/activate"
