# Evaluación Final Módulo 2: SQL y Análisis de Datos

  Autora: Natalia Pozo
  Bootcamp: Adalab - Data Analytics (Módulo 2)

## 📝 Descripción

Este repositorio contiene el trabajo realizado como evaluación final del Módulo 2, poniendo en práctica los conocimientos adquiridos sobre Bases de Datos Relacionales (MySQL) y su conexión con Python.
El objetivo principal ha sido simular el flujo de trabajo de una Analista de Datos: desde la obtención y limpieza de datos "en crudo", hasta su almacenamiento en una base de datos propia y la ejecución de consultas para responder preguntas de negocio.

El proyecto se divide en dos partes:
  - Creación de BBDD con Python: Conexión a API y modelado de datos.
  - Análisis con SQL: Resolución de ejercicios sobre la base de datos de ejemplo Sakila.

## 📂 Estructura del Proyecto

El repositorio contiene los siguientes archivos:
  - ejercicio_1_bbdd_pelis_json.ipynb: Notebook principal. Contiene el código Python para la extracción de datos, limpieza, creación de la base de datos pelis_adalab e inserción de la información.
  - ejercicio_2_bbdd_Sakila.sql: Script de SQL. Contiene las 15 consultas que resuelven los ejercicios planteados sobre la base de datos sakila.
  - README.md: Documentación del proyecto.

## ✨ Resumen del trabajo realizado

El proyecto se estructura en dos ejercicios para desarrollar habilidades específicas:

### Ejercicio 1: De la API a la Base de Datos (.ipynb)

En este ejercicio se ha realizado el flujo completo del dato:

1. Extracción y limpieza: Conexión a la API de películas de Adalab mediante la librería requests. Uso de Pandas para transformar el JSON en un DataFrame y preparar los datos.
2. Creación de la BBDD: Diseño de un esquema con tablas relacionadas (peliculas, idiomas y una tabla intermedia) aplicando principios de normalización.
3. Inserción: Desarrollo de un script en Python para insertar los registros en MySQL, asegurando el control de duplicados.
4. Extracción de información: Cálculo y resolución de subconsultas.

### Ejercicio 2: Consultas en Sakila (.sql)

En esta sección se utiliza SQL para la extracción de información:

  - Uso de filtros con WHERE, LIKE y BETWEEN.
  - Conexión de múltiples tablas  mediante JOIN.
  - Cálculo de estadísticas (medias, totales) agrupando datos con GROUP BY.
  - Resolución de lógica compleja mediante Subconsultas.

## 🛠️ Tecnologías utilizadas

  - Lenguajes: Python (3.13.9) y SQL.
  - Librerías: pandas (manipulación de datos), requests (API), mysql-connector-python (conexión Python-MySQL).
  - Conceptos clave: Creación de tablas (DDL), manipulación de datos (DML), consultas (DQL), claves primarias y foráneas.

## 🚀 Instrucciones de ejecución

Para ejecutar este proyecto en local:

### Requisitos

  - Instalación de MySQL y Python con las siguientes librerías:

pip install requests / pip install mysql-connector-python / pip instal pandas



  - Paso 1: Código Python

Abrir el archivo ejercicio_1_bbdd_pelis_json.ipynb en VS Code.

Importante: Actualizar la contraseña de MySQL en las celdas de conexión.

Ejecutar las celdas secuencialmente para crear la base de datos y visualizar los resultados.

  - Paso 2: Consultas SQL

Abrir un gestor de base de datos (ej. MySQL Workbench).

Cargar el archivo ejercicio_2_bbdd_Sakila.sql.

Ejecutar las consultas sobre la base de datos sakila.

## 🔮 Retos y mejoras futuras

Durante el desarrollo del proyecto se han identificado las siguientes áreas de mejora:

  - Gestión de IDs: En la fase 3 (fase de inserción) del ejercicio 1, se implementó una asignación manual de IDs para asegurar la integridad referencial entre películas y subtítulos. Como mejora futura, se investigará la gestión nativa de estos índices en MySQL para evitar la intervención manual.
  - Optimización del código: El script de inserción actual utiliza bucles anidados. Se plantea refactorizar esta lógica para mejorar la eficiencia y limpieza del código.
  - Documentación en inglés: El objetivo a corto plazo es migrar la documentación al inglés para adaptar el perfil a entornos internacionales.

Cualquier feedback sobre el código o la estructura es bienvenido :)
