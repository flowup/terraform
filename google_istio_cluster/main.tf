# module "service_account" {
#   source = "git::git@github.com:flowup/terraform.git//google_service_account?ref=master"
#   name   = "${var.name}-gke"

#   roles = [
#     "roles/logging.logWriter",
#     "roles/monitoring.metricWriter",
#     "roles/storage.objectViewer",
#     "roles/cloudtrace.agent",
#   ]
# }

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

  provisioner "local-exec" {
    command = "${data.template_file.init_startup_script.rendered}"
  }
}

resource "google_container_node_pool" "primary_pool" {
  name = "${var.name}-pool"
  cluster = "${google_container_cluster.primary_cluster.name}"
  zone = "${var.zone}"
  node_count = "${var.cluster_size}"

  node_config {
    machine_type    = "${var.machine_type}"
    # service_account = "${module.service_account.email}"
    preemptible     = "${var.preemptible_nodes}"
    oauth_scopes = "${var.oauth_scopes}"
  }
}

data "template_file" "init_startup_script" {
  template = "${file("${path.module}/startup.sh")}"

  vars {
    name          = "${var.name}"
    zone          = "${var.zone}"
    istio_version = "${var.istio["version"]}"
    mtls_enabled  = "${var.istio["mtls_enabled"]}"
    certmanager_enabled  = "${var.istio["certmanager_enabled"]}"
  }
}
