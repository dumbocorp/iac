terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "sudocorp"
    workspaces {
      name = "ecommerce-platform"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}
