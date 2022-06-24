terraform {
  backend "s3" {
    bucket = "terraform-backend"
    key    = "network/eip.tfstate"
    region = "us-east-1"
  }
}
