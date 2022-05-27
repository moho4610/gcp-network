
terraform {
  required_version = ">= 0.13.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.50"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.50"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "michelle-ntt"
    workspaces {
      prefix = "gcp-networking-"
    }
  }

  #remote workspace for testing
  # cloud {
  #   organization = "michelle-ntt"
  #   workspaces {
  #     prefix = "gcp-networking-dev"
  #   }
  # }
}

locals {
  landingzone_label = {
    "landingzone" = var.landingzone.key
  }
  labels = merge(local.landingzone_label, var.labels, { "dpac_version" = var.dpac_version })
}



