provider "google" {
  project     = "flowcloud-153422"
  region      = "europe-west1-d"
  credentials = ""
}

data "google_container_cluster" "kopernik" {
  name   = "kopernik"
  zone   = "europe-west1-d"
}

output "cluster_cidr" {
  value = "${data.google_container_cluster.kopernik.cluster_ipv4_cidr}"
}

output "master_cidr" {
  value = "${data.google_container_cluster.kopernik.ip_allocation_policy.services_ipv4_cidr_block}"
}
