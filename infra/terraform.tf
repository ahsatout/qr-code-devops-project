terraform {
  backend "s3" {
    bucket         = "state-lock-asatout"
    key            = "terraform/state"
    region         = "us-east-2"
    dynamodb_table = "state-lock"
    encrypt        = true
  }
}