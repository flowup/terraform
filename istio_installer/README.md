# Istio and Helm Installer for Kubernetes

## Usage

Run tool [task](https://github.com/go-task/task):
```
task install CLUSTER_NAME=[cluster name] CLUSTER_ZONE=[cluster's zone] CONFIG=[path to custom values.yaml for istio]
```

Available parameters with defaults:

| Parameter | Default | Description |
| --- | --- | --- |
| CLUSTER_NAME | test | Name of the cluster |
| CLUSTER_ZONE | europe-west1-d | Zone where cluster runs | 
| VERSION_HELM | 2.10.0 | Version of Helm |
| VERSION_ISTIO | 1.0.2 | Version of Istio |
| CONFIG | values.yaml | Absolute path to values.yaml configuration of Istio | 
