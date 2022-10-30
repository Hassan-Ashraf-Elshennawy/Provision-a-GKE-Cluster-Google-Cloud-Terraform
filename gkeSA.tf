
resource "google_service_account" "gke-sa" {
  account_id   = "gke-sa"
  display_name = "GKE Service Account"
  
}


resource "google_project_iam_member" "gke-role" {
  project = "GCP_PROJECT"
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.gke-sa.email}"
}

resource "google_project_iam_member" "gke-admin-role" {
  project = "GCP_PROJECT"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke-sa.email}"
}

