resource "google_artifact_registry_repository" "my-processing-repo" {
  location      = "us-central1"
  repository_id = "video-processing-repo"
  description   = "Docker repository for video processing service"
  format        = "DOCKER"
}

module "pubsub" {
  source  = "terraform-google-modules/pubsub/google"
  version = "~> 5.0"

  topic      = "video-uploads"
  project_id = "utube-c6906"
  push_subscriptions = [
    {
      name                 = "push"                                                                   // required
      ack_deadline_seconds = 600                                                                      // optional
      push_endpoint        = "https://video-processing-service-l3jywyguea-uc.a.run.app/process-video" // required
    }
  ]
}
resource "google_storage_bucket" "raw-bucket" {
  name          = "ut-raw-videos"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "processed-bucket" {
  name          = "ut-processed-videos"
  location      = "US"
  force_destroy = true
}
