provider "aws" {
  region = "us-west-1"
  assume_role {
    role_arn     = "arn:aws:iam::123456789012:role/my-role"
    session_name = "my-session"
  }
}
