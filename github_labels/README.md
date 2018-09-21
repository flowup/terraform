# Github Repository Labels

Creates Labels on a specified Github Repository

## Example

```
provider "github" {
  token        = ""
  organization = ""
}

module "service_account" {
  source = "git::git@github.com:flowup/terraform.git//github_labels?ref=master"
  repo   = "${var.repo}"

  general = {
    "bug" = "d73a4a"
    "regression" = "c11325"
    "feature" = "6cc138"
    "enhancement" = "b0ea8c"
  }
  layers = {
    "front-end" = "1d76db"
    "back-end" = "f97625"
    "infrastructure" = "FFD700"
  }
  feats = [
    "landing",
    "onboarding",
    "dashboard",
  ]
  utils = [
    "documentation",
    "responsivity",
    "tests",
  ]
  estimates = [
    "1",
    "2",
    "3",
    "5",
    "8",
    "13",
    "21",
    "40",
  ]
  frequencies = [
    "low",
    "medium",
    "high",
  ]
  severities = [
    "trivial",
    "minor",
    "major",
    "critical",
  ]
}
```