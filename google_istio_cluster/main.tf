module "service_account" {
  source = "git::git@github.com:flowup/terraform.git//google_service_account?ref=master"
  name   = "${var.name}-gke"

  roles = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/storage.objectViewer",
    "roles/cloudtrace.agent",
  ]
}

resource "google_container_cluster" "primary_cluster" {
  name = "${var.name}"
  zone = "${var.zone}"

  addons_config {
    kubernetes_dashboard {
      disabled = true
    }
  }

  initial_node_count = "${var.cluster_size}"

  node_config {
    machine_type    = "${var.machine_type}"
    service_account = "${module.service_account.email}"
  }

  provisioner "local-exec" {
    command = "${data.template_file.init_startup_script.rendered}"
  }

  depends_on = ["module.service_account"]
}

data "template_file" "init_startup_script" {
  template = "${file("${path.module}/startup.sh")}"

  vars {
    name          = "${var.name}"
    zone          = "${var.zone}"
    istio_version = "${var.istio_version}"
  }
}
