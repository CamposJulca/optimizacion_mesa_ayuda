#!/bin/bash

echo "🔍 Analizando patrones costosos en notebook_extracted.py..."

SOURCE_FILE="notebook_extracted.py"
OUTPUT_FILE="analisis_bucles_costosos.txt"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "❌ No se encontró $SOURCE_FILE"
    exit 1
fi

echo "=============================================" > $OUTPUT_FILE
echo "ANÁLISIS DE PATRONES COMPUTACIONALMENTE COSTOSOS" >> $OUTPUT_FILE
echo "Fecha: $(date)" >> $OUTPUT_FILE
echo "=============================================" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "🔎 Buscando FOR loops..." >> $OUTPUT_FILE
grep -n "for " $SOURCE_FILE >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "🔎 Buscando posibles FOR anidados (heurística simple)..." >> $OUTPUT_FILE
awk '
/for / { 
    line1 = NR; 
    text1 = $0; 
    getline; 
    if ($0 ~ /for /) {
        print "Posible FOR anidado en línea " line1 ": " text1;
        print "  -> Línea " NR ": " $0;
        print "";
    }
}' $SOURCE_FILE >> $OUTPUT_FILE

echo "" >> $OUTPUT_FILE

echo "🔎 Buscando uso de .iloc ..." >> $OUTPUT_FILE
grep -n "\.iloc" $SOURCE_FILE >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "🔎 Buscando uso de .loc dentro de bucles..." >> $OUTPUT_FILE
grep -n "\.loc" $SOURCE_FILE >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "🔎 Buscando uso de range(len(" >> $OUTPUT_FILE
grep -n "range(len(" $SOURCE_FILE >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

echo "=============================================" >> $OUTPUT_FILE
echo "✅ Análisis completado." >> $OUTPUT_FILE

echo "✅ Resultado guardado en $OUTPUT_FILE"
