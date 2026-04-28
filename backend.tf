terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "infra-exam-terraform-angel-gonzalez"
    key     = "exam/s3-angel-gonzalez/terraform.tfstate"
    encrypt = true
  }
}