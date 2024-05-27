variable "terraform_state_bucket_name" {
  type = string
  description = "Name of the terraform state bucket. default is terraform_state_bucket_mastodon"
  default = "terraform-state-bucket-mastodon"
}
variable "terraform_state_lock_table_name" {
  type = string
  description = "Name of the terraform state lock. Default is terraform_state_lock_table_mastodon "
  default = "terraform_state_lock_table_mastodon"
}
variable "region" {
  type = string
  description = "Which region is going to be used."
}
