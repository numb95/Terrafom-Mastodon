output "terraform_state_bucket_name_output" {
  value = "Current s3 bucket for terraform state bucket: ${var.terraform_state_bucket_name}"
}
output "terraform_state_lock_table_name_output" {
  value = "Current Dynamodb table for locking the terraform state: ${var.terraform_state_bucket_name}"
}
