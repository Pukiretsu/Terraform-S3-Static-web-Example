# declaración del modulo dinamico para la(s) paginas
module "module-s3-static-website" {
  source       = "./modules/s3-static-website"
  site_configs = var.s3-static-pages
  global_tags  = var.global_tags
  account      = var.cuenta
  project      = var.proyecto
}