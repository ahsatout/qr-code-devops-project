resource "aws_dynamodb_table" "tf_state_lock" {
    name         = "terraform-state-lock"
    write_capacity = 1
    read_capacity = 1
    hash_key     = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }

    tags = {
      Name        = "Terraform State Lock"
      Environment = "Dev"
    }
}