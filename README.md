# De Desempleado a Investigador de Operaciones (IO)
## Mi Ruta de Aprendizaje en Optimización Discreta

**Autor:** [Luis Miguel Marín Cadavid]
**Objetivo:** Transicionar del enfoque puramente llevado el P**s al enfoque prescriptivo (IO), aprendiendo a modelar problemas complejos de decisión bajo restricciones.

---

## ¿Por qué esta ruta?

El verdadero valor para las empresas está en la **prescripción** (¿Qué debo hacer con lo que va a pasar?). 

La Investigación de Operaciones (IO) nos da las herramientas para encontrar la **acción óptima** maximizando ganancias o minimizando costos, considerando restricciones de capacidad, tiempo y presupuesto.

---

## Hoja de Ruta del Aprendizaje

Esta ruta está diseñada para alguien que **ya sabe programar en Python** y tiene bases de álgebra lineal, cálculo y estadística.

### Fase 0: Cambio de Mentalidad
- Interiorizar: *"Primero la ecuación, luego los datos"*
- Entender que la IO busca **decisiones**, no predicciones.

### Fase 1: Fundamentos Matemáticos (Repaso)
- Programación Lineal (PL): Poliedros, vértices y holgura.
- Programación Entera (PE): Variables binarias (sí/no).
- Dualidad: Precios sombra y valor de los recursos escasos.

### Fase 2: Cursos Especializados
*Especialización en Optimización Discreta en Coursera*

| Curso | Estado | Fecha |
| :--- | :---: | :--- |
| **Basic Modeling for Discrete Optimization** | [ ] Pendiente | |
| **Advanced Modeling for Discrete Optimization** | [ ] Pendiente | |
| **Solving Algorithms for Discrete Optimization** | [ ] Pendiente (Opcional inicial) | |

**Nota:** MiniZinc es el lenguaje académico usado en los cursos. La lógica de modelado es 100% transferible a Pyomo/PuLP en Python.

---

## Herramientas que debo dominar (Sí o Sí)

### 1. Modelado y Optimización en Python
- **Pyomo**: Librería estándar para optimización matemática en Python.
- **PuLP**: Versión más ligera para problemas simples.
- **HiGHS**: Solver open-source (motor de optimización). Alternativa gratuita a Gurobi/CPLEX.
- **scipy.optimize**: Para problemas no lineales pequeños.

### 2. Simulación de Eventos Discretos
- **SimPy**: Simulación de colas, procesos estocásticos y sistemas con incertidumbre.

### 3. Visualización y Despliegue
- **Plotly**: Visualización interactiva de rutas y soluciones.
- **Streamlit** / **Dash**: Crear dashboards para que los usuarios interactúen con los modelos.

### 4. Datos y Bases de Datos
- **SQL Avanzado**: Ventanas (`PARTITION BY`, `ROW_NUMBER`) para agregaciones temporales.
- **TimescaleDB** / **InfluxDB**: Consultas de series temporales (logística, energía, IoT).

---

## 📚 Proyectos Prácticos (Mi Portfolio IO)

### Proyecto 1: El Problema de la Mochila (Knapsack)
- **Descripción:** Optimizar la selección de objetos con peso y valor limitados.
- **Herramientas:** PuLP + HiGHS.
- **Estado:** [ ] Pendiente

### Proyecto 2: Problema del Transporte
- **Descripción:** Minimizar costo de envío desde fábricas a tiendas con capacidades limitadas.
- **Herramientas:** Pyomo + HiGHS + Plotly (mapa de rutas).
- **Estado:** [ ] Pendiente

### Proyecto 3: Planificación de Turnos (Staff Scheduling)
- **Descripción:** Asignar horarios a empleados cumpliendo restricciones de descanso y cobertura.
- **Herramientas:** Pyomo (variables binarias) + Streamlit.
- **Estado:** [ ] Pendiente

### Proyecto 4: Simulación de una Cola (SimPy)
- **Descripción:** Simular un sistema de atención al cliente con tiempos de llegada aleatorios.
- **Herramientas:** SimPy + NumPy.
- **Estado:** [ ] Pendiente

### Proyecto Integrador Final: Optimización de Cadena de Suministro
- **Descripción:** Combinar ML (predicción de demanda) + IO (optimización de inventario y rutas) + Simulación (incertidumbre).
- **Herramientas:** XGBoost + Pyomo + SimPy + Streamlit.
- **Estado:** [ ] Pendiente

---

## 📖 Recursos Recomendados

### Cursos
- [Basic Modeling for Discrete Optimization](https://www.coursera.org/learn/basic-modeling-for-discrete-optimization) - Universidad de Melbourne
- [Advanced Modeling for Discrete Optimization](https://www.coursera.org/learn/advanced-modeling-for-discrete-optimization) - Universidad de Melbourne
- [Solving Algorithms for Discrete Optimization](https://www.coursera.org/learn/solving-algorithms-for-discrete-optimization) - Universidad de Melbourne

### Libros (Consulta)
- *Introduction to Operations Research* - Hillier & Lieberman
- *Model Building in Mathematical Programming* - H. Paul Williams

### Repositorios y Tutoriales
- [Pyomo Gallery](https://github.com/Pyomo/pyomo/tree/main/examples) - Ejemplos oficiales
- [Python for Operations Research](https://github.com/jckantor/OR-Python) - Libro interactivo de Jeffrey Kantor

### Comunidades
- [r/OperationsResearch](https://www.reddit.com/r/OperationsResearch/)
- [INFORMS](https://www.informs.org/) - Sociedad internacional de IO

---

## 📊 Mi Progreso

| Área | Nivel Actual | Nivel Deseado |
| :--- | :---: | :---: |
| Modelado en MiniZinc | ⭐☆☆☆☆ | ⭐⭐⭐⭐⭐ |
| Pyomo / PuLP | ⭐☆☆☆☆ | ⭐⭐⭐⭐⭐ |
| Simulación (SimPy) | ⭐☆☆☆☆ | ⭐⭐⭐⭐☆ |
| Teoría de Algoritmos (Branch & Bound) | ⭐☆☆☆☆ | ⭐⭐⭐☆☆ |
| Proyectos Completados | 0 / 5 | 5 / 5 |

---

**Última actualización:** [28 Jun 2026]
**Estado del proyecto:** En progreso
