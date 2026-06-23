from pyspark import pipelines as dp

@dp.table()
def orders_bronze():
    return (
        spark.readStream
        .format("cloudFiles")
        .option("cloudFiles.format", "csv")
        .option("header", "true")
        .option("cloudFiles.schemaEvolutionMode", "rescue")
        .load("/Volumes/bronze/default/csv")
    )