

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.83.0"
    }
  }
}

provider "google" {
  credentials = file("/home/user/Documents/cscc73_final/utube-c6906-8626d0a03395.json")
  project     = "utube-c6906"
  region      = "us-central1"
}
