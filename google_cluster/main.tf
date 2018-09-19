resource "google_container_cluster" "primary_cluster" {
  name = "${var.name}"
  zone = "${var.zone}"

  addons_config {
    kubernetes_dashboard {
      disabled = true
    }
  }

  min_master_version = "${var.kubernetes_version}"
  initial_node_count = "1"
  remove_default_node_pool = true
}

resource "google_container_node_pool" "primary_pool" {
  name = "${var.name}-pool"
  cluster = "${google_container_cluster.primary_cluster.name}"
  zone = "${var.zone}"
  node_count = "${var.cluster_size}"

  node_config {
    machine_type    = "${var.machine_type}"
    preemptible     = "${var.preemptible_nodes}"
    oauth_scopes = "${var.oauth_scopes}"
  }
}