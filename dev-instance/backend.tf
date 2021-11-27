terraform {
  backend "s3" {
    bucket = "devopsreport-terraform"
    key    = "terraform-getting-started/dev-instance.tf"
    region = "us-east-1"
  }
}
