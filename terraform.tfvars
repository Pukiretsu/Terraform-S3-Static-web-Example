# Tags solicitadas
global_tags = {
  "enviroment" = "dev"
  "owner"      = "Angel-Gonzalez-Padilla"
  "Project"    = "Betek"
}

# configuracion de las paginas estaticas
s3-static-pages = {
  "index-page" = {
    bucket_name    = "Pagina-index"
    index_document = "index.html"
    sec_tags       = { page = "main", costcenter = "123" }
    folder_path    = "website"
  },
  "docs-site" = {
    bucket_name    = "docs"
    index_document = "index.html"
    folder_path    = "docs"
    sec_tags       = { page = "docs", costcenter = "4325" }
  }
}

# Estas dos variables son para que el nombre del bucket no de problemas
cuenta   = "angonzalezpa"
proyecto = "betek"
