module "global_configuration" {
  source                          = "./modules/global"
  terraform_state_bucket_name     = "terraform_state_bucket_mastodon_init"
  terraform_state_lock_table_name = "terraform_state_lock_table_mastodon_init"

}
