module "global_configuration" {
  source                          = "./modules/global"
  terraform_state_bucket_name     = "terraform-state-bucket-mastodon-init"
  terraform_state_lock_table_name = "terraform_state_lock_table_mastodon_init"
  region = "us-east-2"
}
