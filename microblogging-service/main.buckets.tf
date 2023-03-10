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

resource "random_pet" "blogs_box_name" {}

resource "google_compute_instance" "blogs_box" {
  name         = "blogs-${random_pet.blogs_box_name.id}"
  machine_type = "e2-micro"
  zone         = var.zone

  access_config {
    # Will provision an ephemeral external / public IP address
  }
}
