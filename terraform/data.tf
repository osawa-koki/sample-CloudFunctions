
resource "google_storage_bucket" "my_bucket" {
  name     = "${var.project_name}-bucket"
  location = "us-central1"
}

resource "google_storage_bucket_object" "zip" {
  name   = "function.zip"
  bucket = google_storage_bucket.my_bucket.name
  source = "path/to/function/code"
}
