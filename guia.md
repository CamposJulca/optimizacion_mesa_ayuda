Excelente, Daniel.
Ahora sí estamos en fase formal de migración controlada.

Ya tenemos:

* `main` estable
* `develop` listo
* Tests pasando
* Arquitectura modular
* Repo versionado

Ahora empezamos migración  **con disciplina** .

---

# 🎯 ¿Por cuál bloque del notebook empezar?

La respuesta técnica correcta es:

> 🔵 Empezamos por el bloque de extracción y consulta SQL.

No por el modelo.

No por métricas.

No por features.

Porque si no controlamos la fuente de datos, todo lo demás queda frágil.

---

# 🔍 Estructura típica del notebook que vimos

En tu notebook existen estos bloques:

1. Imports
2. Conexión pyodbc
3. Query SQL
4. Carga en pandas
5. Limpieza
6. Transformaciones
7. Feature engineering
8. Modelado
9. Evaluación
10. Visualización

---

# 🧠 Orden correcto de migración

### Fase 1 – Infraestructura real

* Extraer conexión
* Extraer queries
* Mover SQL a `infrastructure/repositories.py`
* Probar con mock

### Fase 2 – Limpieza real

* Migrar funciones reales de limpieza
* Crear pruebas unitarias específicas

### Fase 3 – Feature engineering real

* Migrar variables derivadas
* Probar consistencia

### Fase 4 – Modelado real

* Migrar parámetros
* Validar que métricas coincidan con notebook

---

# 🚀 Paso inmediato

Creamos rama:

```bash
git checkout develop
git checkout -b feature/migracion-bloque-1-extraccion
```

---

# 🔬 Ahora necesito esto de ti

Antes de escribir código:

En tu notebook `ProyectoFinal2.ipynb`, el bloque SQL:

* ¿Está hardcodeado?
* ¿Tiene múltiples queries?
* ¿Hace joins complejos?
* ¿Calcula campos en SQL?
* ¿Filtra por fechas?

Porque eso define cómo diseñamos `QueryRepository`.

---

# 🎯 Qué vamos a hacer ahora

Vamos a:

1. Extraer el bloque SQL textual.
2. Convertirlo en método dentro de `QueryRepository`.
3. Modificar `DataPipeline.extract()` para usarlo.
4. Crear test con mock para la extracción.
5. Commit formal del bloque 1.

---

Daniel, respóndeme esto:

¿Puedes copiarme aquí el bloque SQL principal del notebook?
Con eso diseñamos correctamente la primera migración.
