# Google Cloud GKE Cluster with preinstalled Istio

Creates Google Kubernetes Engine Cluster with preinstalled Istio

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
  istio_version = "0.8.0"        # Default (Latest)
}
```