resource "random_pet" "blogs_box_name" {}

resource "google_compute_instance" "blogs_box" {
  name         = "blogs-${random_pet.blogs_box_name.id}"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Setup Ephemeral public IP
    }
  }

  metadata_startup_script = "curl -X POST -H 'Content-type: application/json' --data '{\"text\":\"I have booted\"}' https://hooks.slack.com/services/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"
}
