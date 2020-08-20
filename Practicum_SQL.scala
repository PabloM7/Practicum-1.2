// Databricks notebook source
//Cargar y leer el Archivo
val data = spark //Todo el dataset se almacena en una variable. 
  .read //read para la lectura del archivo.
  .option("InferSchema","true") // Este linea nos permite inferir el esquema.
  .option("header","true") //Esta opcion permite aparecer las cabezeras de columna.
  .option("delimiter","\t") //Aqui debemos colocar el demilitador de nuestro archivo.
  .csv("/FileStore/tables/Datos_ENEMDU_PEA_v2.csv") //En caso de ser databricks se debe colocar la ruta del archivo almacenado.
//Caso contrario colocar la direccion del archivo del directorio.

// COMMAND ----------

//Importacion de la libreria types
import org.apache.spark.sql.types._
// El esquema se alamcena en una variable
val myDataSchema = StructType(
  Array( // Se defienen los nombres de la columna y su tipo de dato acompañado de la palabra True  
        StructField("id", IntegerType, true),
        StructField("anio", IntegerType, true),
        StructField("mes", IntegerType, true),
        StructField("provincia", IntegerType, true),
        StructField("canton", IntegerType, true),
        StructField("area", StringType, true),
        StructField("genero", StringType, true),
        StructField("edad", IntegerType, true),
        StructField("estado", StringType, true),
        StructField("nivel_de_instruccion", StringType, true),
        StructField("etnia", StringType, true),
        StructField("ingreso_laboral", IntegerType, true),
        StructField("condicion_actividad", StringType, true),
        StructField("sectorizacion", StringType, true),
        StructField("grupo_ocupacion", StringType, true),
        StructField("rama_actividad", StringType, true),
        StructField("factor_expansion", DoubleType, true)
      ));

// COMMAND ----------

val data = spark
  .read
  .schema(myDataSchema)
  .option("InferSchema","true")
  .option("header","true")
  .option("delimiter","\t")
  .csv("/FileStore/tables/Datos_ENEMDU_PEA_v2.csv")

// COMMAND ----------

import org.apache.spark.sql.functions._ //Importar librerias

// COMMAND ----------

val provinces = spark
  .read
  .option("InferSchema","true")
  .option("header","true")
  .option("delimiter","\t")
  .csv("/FileStore/tables/provincias.csv")

// COMMAND ----------

val Innerprovinces = data.join(provinces, data("provincia") === provinces("codigoprov"), "inner")

// COMMAND ----------

val dataf = Innerprovinces.drop("codigoprov").drop("provincia")

// COMMAND ----------

//Crear una vista temporal
dataf.createOrReplaceTempView("SQL_TABLE") 

// COMMAND ----------

//Emplear SQL y métodos spark/dataframe
spark.sql("""
    SELECT nombreprov as Provincia, count(*) 
    FROM SQL_TABLE
    GROUP BY nombreprov
""")
    .where ("nombreprov like '%Guayas%'")
    .show(1)

// COMMAND ----------

//Emplear SQL y métodos spark/dataframe
spark.sql("""
    SELECT rama_actividad, Count(*)
    FROM SQL_TABLE
    GROUP BY rama_actividad
""")
    .where ("rama_actividad like '%01 - A. Agricultura, ganadería caza y silvicultura y pesca%'")
    .show(false)

// COMMAND ----------

//Emplear SQL y métodos spark/dataframe
spark.sql("""
    SELECT edad, Count(*)
    FROM SQL_TABLE
    GROUP BY edad
""")
    .where("`edad` < 18")
    .show(false)

// COMMAND ----------


