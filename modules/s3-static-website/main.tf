resource "aws_s3_bucket" "this" {
  for_each = var.site_configs
  bucket   = lower("ause1-s3-${var.account}-${var.project}-${each.value.bucket_name}")
  tags     = merge(var.global_tags, each.value.sec_tags)
}

resource "aws_s3_bucket_website_configuration" "this" {
  for_each = var.site_configs
  bucket   = aws_s3_bucket.this[each.key].id

  index_document {
    suffix = each.value.index_document
  }
}

# Desactivamos el S3 Public Access Block (Obligatorio para paginas publicas)
resource "aws_s3_bucket_public_access_block" "this" {
  for_each = var.site_configs
  bucket   = aws_s3_bucket.this[each.key].id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Policy para el acceso a lectura
resource "aws_s3_bucket_policy" "this" {
  for_each = var.site_configs
  bucket   = aws_s3_bucket.this[each.key].id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "PublicRead"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.this[each.key].arn}/*"
    }]
  })
}

# Soporte para subida de diferentes tipos de archivos comunes
locals {
  mime_types = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".png"  = "image/png"
  }
}

# 
resource "aws_s3_object" "index" {
  for_each = var.site_configs

  bucket       = aws_s3_bucket.this[each.key].id
  key          = "index.html"
  
  # Dynamics: path.root + src/ + the folder defined in tfvars + index.html
  source       = "${path.root}/src/${each.value.folder_path}/index.html"
  
  content_type = "text/html"
}