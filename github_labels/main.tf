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

resource "github_issue_label" "repo" {
    count = "${length(var.general)}"
    repository = "${var.repo}"
    name = "${element(keys(var.general), count.index)}"
    color = "${lookup(var.general, element(keys(var.general), count.index))}"
}

resource "github_issue_label" "repo" {
    count = "${length(var.feats)}"
    repository = "${var.repo}"
    name = "feat: ${element(var.feats, count.index)}"
}

resource "github_issue_label" "repo" {
    count = "${length(var.utils)}"
    repository = "${var.repo}"
    name = "util: ${element(var.feats, count.index)}"
}
