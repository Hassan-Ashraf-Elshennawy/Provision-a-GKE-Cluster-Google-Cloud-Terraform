resource "google_compute_router" "route_table" {
  name    = "route_table"
  region  = "us-central1"
  network = google_compute_network.vpc_network_gcp.id
}