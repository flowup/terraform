variable "name" {
  type        = "string"
  description = "Name of the cluster"
}

variable "zone" {
  type        = "string"
  description = "Zone where cluster should be created"
}

variable "machine_type" {
  default     = "n1-standard-1"
  type        = "string"
  description = "Machine type in the nodepool"
}

variable "cluster_size" {
  default     = 3
  type        = "string"
  description = "Number of machines in the nodepool"
}

variable "istio" {
  type = "map"
  default = {
    version = "1.0.0"
    mtls_enabled = "true"
    certmanager_enabled = "true"
  }
}

variable "oauth_scopes" {
  type = "list"
  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring"
  ]
}

variable "kubernetes_version" {
  default     = "1.10"
  type        = "string"
  description = "Kubernetes version"
}

variable "preemptible_nodes" {
  default     = false
  description = "Preemptible nodes in default nodepool"
}
