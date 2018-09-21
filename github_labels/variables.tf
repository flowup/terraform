variable "repo" {
  type        = "string"
  description = "Name of the repository"
  default = "labeltest"
}

variable "general" {
  type = "map"
  description = "List of architectural layers"
  default = {
    "bug" = "d73a4a"
    "regression" = "c11325"
    "feature" = "6cc138"
    "enhancement" = "b0ea8c"
  }
}

variable "layers" {
  type = "map"
  description = "List of architectural layers"
  default = {
    "front-end" = "1d76db"
    "back-end" = "f97625"
    "infrastructure" = "FFD700"
  }
}

variable "feats" {
  type        = "list"
  description = "List of features"
  default = [
    "landing",
    "onboarding",
    "dashboard",
  ]
}

variable "utils" {
  type        = "list"
  description = "List of utilities"
  default = [
    "documentation",
    "responsivity",
    "tests",
  ]
}

variable "estimates" {
  type = "list"
  description = "List of estimations"
  default = [
    "1",
    "2",
    "3",
    "5",
    "8",
    "13",
    "21",
    "40",
  ]
}

variable "frequencies" {
  type = "list"
  description = "List of frequency labels"
  default = [
    "low",
    "medium",
    "high",
  ]
}

variable "severities" {
  type = "list"
  description = "List of severities"
  default = [
    "trivial",
    "minor",
    "major",
    "critical",
  ]
}