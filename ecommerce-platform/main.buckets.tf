resource "random_pet" "data_bucket_name" {}

module "data_bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 3.4"

  name     = "sudocorp-${random_pet.data_bucket_name.id}"
  location = var.region
  iam_members = [
    {
      role   = "roles/storage.objectViewer"
      member = "user:francois@bootsecurity.io"
    }
  ]
}

