resource "aws_dynamodb_table" "terraform_state_lock_table" {
    name = var.terraform_state_lock_table_name
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
    lifecycle {
      prevent_destroy = true
    }
    tags = {
      Name        = "${var.terraform_state_bucket_name}"
      Service     = "terraform"
      Environment = "global"
    }
}
