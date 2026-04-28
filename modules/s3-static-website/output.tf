output "website_urls" {
  description = "Endpoints estaticos para las paginas"
  value = {
    for key, bucket in aws_s3_bucket_website_configuration.this : 
    key => bucket.website_endpoint
  }
}