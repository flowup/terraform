provider "google" {
  project     = "flowup-calchas"
  region      = "europe-west1-d"
  credentials = ""
}

module "cluster" {
  source = "../google_istio_cluster"
  name   = "test"
  
  zone = "europe-west1-d"
  machine_type = "n1-standard-1" # Default
  cluster_size = 2               # Default
  kubernetes_version = "1.10"   # Default = "1.10"
  preemptible_nodes = true       # Default = 
  
  istio {
      version = "1.0.0"
      mtls_enabled = "true"
  }
}