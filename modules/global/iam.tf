resource "aws_iam_policy" "cicd_policy" {
  name = "CICDReadOnlyPolicy"
  policy = templatefile("${path.module}/templates/policy.json.tpl", {
    s3_bucket_name = aws_s3_bucket.terraform_state_bucket.id
    dynamodb_table_name = aws_dynamodb_table.terraform_state_lock_table.id
    account_id = data.aws_caller_identity.current.account_id
    region = var.region
  })
}
  