# module "service_account" {
#   source = "git::git@github.com:flowup/terraform.git//github_labels?ref=master"
#   name   = "${var.name}-gke"
#
#   feat = [
#     "landing"
#   ]
#
#   util = [
#     "responsivity"
#   ]
# }

resource "github_issue_label" "general_label" {
    count = "${length(var.general)}"
    repository = "${var.repo}"
    name = "${element(keys(var.general), count.index)}"
    color = "${lookup(var.general, element(keys(var.general), count.index))}"
}


resource "github_issue_label" "layer_label" {
    count = "${length(var.layers)}"
    repository = "${var.repo}"
    name = "layer: ${element(keys(var.layers), count.index)}"
    color = "${lookup(var.layers, element(keys(var.layers), count.index))}"
}

resource "github_issue_label" "feat_label" {
    count = "${length(var.feats)}"
    repository = "${var.repo}"
    name = "feat: ${element(var.feats, count.index)}"
    color = "93c1f9"
}

resource "github_issue_label" "util_label" {
    count = "${length(var.utils)}"
    repository = "${var.repo}"
    name = "util: ${element(var.utils, count.index)}"
    color = "71dd81"
}
