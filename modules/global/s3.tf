
resource "aws_s3_bucket" "terraform_state_bucket" {
    bucket = var.terraform_state_bucket_name
    lifecycle {
      prevent_destroy = true
    }
    tags = {
      Name        = "${var.terraform_state_bucket_name}"
      Service     = "terraform"
      Environment = "global"
    }

}

resource "aws_s3_bucket_versioning" "terraform_state_bucket_versioning" {
    bucket = aws_s3_bucket.terraform_state_bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"

    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_bucket_block_public_access" {
    bucket = aws_s3_bucket.terraform_state_bucket.id
    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}
resource "aws_s3_bucket_lifecycle_configuration" "terraform_state_bucket_lifecycle" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  rule {
    id     = "abort-incomplete-multipart-uploads"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }

  rule {
    id     = "delete-noncurrent-object-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 30
    }
  }
}
