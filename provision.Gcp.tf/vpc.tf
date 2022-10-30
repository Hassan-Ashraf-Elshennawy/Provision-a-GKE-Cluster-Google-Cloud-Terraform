resource "google_compute_network" "vpc-network-gcp" {
  project                 = "GCP_PROJECT"
  name                    = "vpc-network-gcp"
  auto_create_subnetworks = false
}
