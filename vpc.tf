resource "google_compute_network" "vpc_network_gcp" {
  project                 = "GCP_PROJECT"
  name                    = "vpc-network_gcp"
  auto_create_subnetworks = false
}
