terraform {
  backend "s3" {
    bucket = "terraform-new83"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}