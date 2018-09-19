# Google Cloud GKE Cluster

Creates Google Kubernetes Engine Cluster

## Example

```
provider "google" {
  project     = "name-of-project"
  region      = "region"
  credentials = ""
}

module "cluster" {
  source = "git::git@github.com:flowup/terraform.git//google_istio_cluster?ref=master"
  name   = "test"
  
  zone = "region"
  machine_type = "n1-standard-1" # Default
  cluster_size = 3               # Default
  kubernetes_version = "1.9.5"   # Default = "1.10"
  preemptible_nodes = true       # Default = false

  oauth_scopes = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring"
  ]
}
```