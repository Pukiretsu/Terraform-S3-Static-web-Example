output "website_urls" {
  description = "The public website endpoints for all deployed pages"
  value = {
    for key, bucket in aws_s3_bucket_website_configuration.this : 
    key => bucket.website_endpoint
  }
}