# Mapear las tags globales solicitadas
variable "global_tags" {
  description = "tags para despliegue"
  type        = map(string)
}

# Configuraciones de los buckets
variable "site_configs" {
  description = "Configs para las paginas estaticas a crear"
  type = map(object({
    # Nombre del bucket a crear
    bucket_name = string
    # ruta del index de la pagina
    index_document = string
    # ruta de la carpeta de la pagina
    folder_path = string
    # tags especificas
    sec_tags       = map(string)
  }))
}

# Para los naming conventions
variable "account" {
    type = string
}

variable "project" {
    type = string
}