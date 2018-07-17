# Google Service Account with membership module

Creates Google Service Account and add membership to provided roles

## Example

Create service account named `test` with roles:

* `logging.logWriter`
* `monitoring.metricWriter`
* `storage.objectViewer`
* `cloudtrace.agent`

```
provider "google" {
  project     = "name-of-project"
  region      = "region"
  credentials = ""
}

module "sa" {
  source = "git::git@github.com:flowup/terraform.git//google_service_account?ref=master"
  name   = "test"

  roles = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/storage.objectViewer",
    "roles/cloudtrace.agent",
  ]
}
```