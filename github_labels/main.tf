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
    repository = "${var.repo}"
    name = "bug"
    color = "FF0000"
}

resource "github_issue_label" "repo" {
    
}