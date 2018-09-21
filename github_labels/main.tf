# provider "github" {
#   token        = ""
#   organization = ""
# }
#
# module "service_account" {
#   source = "git::git@github.com:flowup/terraform.git//github_labels?ref=master"
#   repo   = "${var.repo}"
#
#   general = {
#     "bug" = "d73a4a"
#     "regression" = "c11325"
#     "feature" = "6cc138"
#     "enhancement" = "b0ea8c"
#   }
#   layers = {
#     "front-end" = "1d76db"
#     "back-end" = "f97625"
#     "infrastructure" = "FFD700"
#   }
#   feats = [
#     "landing",
#     "onboarding",
#     "dashboard",
#   ]
#   utils = [
#     "documentation",
#     "responsivity",
#     "tests",
#   ]
#   estimates = [
#     "1",
#     "2",
#     "3",
#     "5",
#     "8",
#     "13",
#     "21",
#     "40",
#   ]
#   frequencies = [
#     "low",
#     "medium",
#     "high",
#   ]
#   severities = [
#     "trivial",
#     "minor",
#     "major",
#     "critical",
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

resource "github_issue_label" "estimate_label" {
    count = "${length(var.estimates)}"
    repository = "${var.repo}"
    name = "est: ${element(var.estimates, count.index)}"
    color = "bfe5bf"
}

resource "github_issue_label" "severity_label" {
    count = "${length(var.severities)}"
    repository = "${var.repo}"
    name = "severity${count.index}: ${element(var.severities, count.index)}"
    color = "8e0741"
}

resource "github_issue_label" "frequency_label" {
    count = "${length(var.frequencies)}"
    repository = "${var.repo}"
    name = "freq${count.index}: ${element(var.frequencies, count.index)}"
    color = "b6c61f"
}
