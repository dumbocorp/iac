resource "random_pet" "blogs_bucket_name" {}

module "blogs_bucket" {
  source     = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version    = "~> 3.4"
  project_id = var.project
  name       = "sudocorp-blogs-${random_pet.blogs_bucket_name.id}"
  location   = var.region
  iam_members = [
    {
      role   = "roles/storage.objectViewer"
      member = "user:francois@boostsecurity.io"
    }
  ]
}
