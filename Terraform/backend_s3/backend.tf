terraform {
  backend "s3" {
    bucket         = "terraform-backend"
    key            = "network/demo.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
  }
}
