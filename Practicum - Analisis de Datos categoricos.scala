// Databricks notebook source
val data = spark
  .read
  .option("InferSchema","true")
  .option("header","true")
  .option("delimiter","\t")
  .csv("/FileStore/tables/Datos_ENEMDU_PEA_v2.csv")

// COMMAND ----------

import org.apache.spark.sql.types._
  val myDataSchema = StructType(
  Array(
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

data.count()

// COMMAND ----------

display(data.describe("area","genero","estado","nivel_de_instruccion","etnia","condicion_actividad","sectorizacion","grupo_ocupacion","rama_actividad"))

// COMMAND ----------

import org.apache.spark.sql.functions._

// COMMAND ----------

data.groupBy("area").count().sort(desc("area")).show(false)

// COMMAND ----------

data.groupBy("genero").count().sort(desc("genero")).show(false)

// COMMAND ----------

data.groupBy("estado").count().sort(desc("estado")).show(false)


// COMMAND ----------

data.groupBy("nivel_de_instruccion").count().sort(desc("nivel_de_instruccion")).show(false)

// COMMAND ----------

data.groupBy("etnia").count().sort(desc("etnia")).show(false)

// COMMAND ----------

data.groupBy("condicion_actividad").count().sort(desc("condicion_actividad")).show(false)

// COMMAND ----------

data.groupBy("sectorizacion").count().sort(desc("sectorizacion")).show(false)

// COMMAND ----------

data.groupBy("rama_actividad").count().sort(desc("rama_actividad")).show(false)

// COMMAND ----------


