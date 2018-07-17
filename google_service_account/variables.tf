variable "roles" {
  type        = "list"
  description = "List of roles that service account should be member of"
}

variable "name" {
  type        = "string"
  description = "Name of the service account"
}

variable "service_account" {
  type        = "string"
  description = "Service account used for accessing resources"
  default     = ""
}
