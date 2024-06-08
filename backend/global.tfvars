bucket          = "terraform-state-bucket-mastodon-init"
region          = "us-east-2"
dynamodb_table  = "terraform_state_lock_table_mastodon_init"
encrypt         = true
key             = "global.tfstate"
