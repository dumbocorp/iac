resource "random_pet" "ecommerce_bucket_name" {}

module "ecommerce_bucket" {
  source     = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version    = "~> 3.4"
  project_id = var.project
  name       = "sudocorp-ecommerce-${random_pet.ecommerce_bucket_name.id}"
  location   = var.region
  iam_members = [
    {
      role   = "roles/storage.objectViewer"
      member = "user:francois@boostsecurity.io"
    }
  ]
}
