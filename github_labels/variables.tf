variable "repo" {
  type        = "string"
  description = "Name of the repository"
}

variable "general" {
  type = "map"
  description = "List of architectural layers"
  default = {
    "" = ""
  }
}

variable "layers" {
  type = "map"
  description = "List of architectural layers"
  default = {
    "" = ""
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
}