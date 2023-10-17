

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.83.0"
    }
  }
}

provider "google" {
  credentials = *
  project     = "utube-c6906"
  region      = "us-central1"
}
