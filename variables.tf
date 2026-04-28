# Variables para nombres validos de los buckets
variable "cuenta" {
  type = string
}

variable "proyecto" {
  type = string
}

# Mapear las tags solicitadas
variable "global_tags" {
  description = "tags para despliegue"
  type        = map(string)
}

# Configuraciones de los buckets
variable "s3-static-pages" {
  description = "Configs para las paginas estaticas a crear"
  type = map(object({
    # Nombre del bucket a crear
    bucket_name = string
    # ruta del index de la pagina
    index_document = string
    # ruta de la carpeta de la pagina
    folder_path = string
    # tags especificas
    sec_tags = map(string)
  }))
}