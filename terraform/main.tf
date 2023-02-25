
provider "google" {
  project = var.project_name
  region  = "us-central1"
}

resource "google_cloudfunctions_function" "my_function" {
  name                  = "${var.project_name}-function"
  description           = "My Cloud Function"
  runtime               = "nodejs16"
  source_archive_bucket        = google_storage_bucket.my_bucket.name
  source_archive_object        = google_storage_bucket_object.zip.name

  trigger_http = true

  entry_point = "myFunction"

  available_memory_mb = 256
  timeout_sec         = 60

  environment_variables = {
    FOO = "bar"
  }

  labels = {
    environment = "dev"
  }

  depends_on = [
    google_storage_bucket_object.zip,
  ]
}
