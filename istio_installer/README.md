# Istio and Helm Installer for Kubernetes

## Usage

Run:
```
make install CLUSTER=[cluster name] ZONE=[cluster's zone] CONFIG=[path to custom values.yaml for istio]
```

Available parameters with defaults:

| Parameter | Default | Description |
| --- | --- | --- |
| CLUSTER | test | Name of the cluster |
| ZONE | europe-west1-d | Zone where cluster runs | 
| VERSION_HELM | 2.10.0 | Version of Helm |
| VERSION_ISTIO | 1.0.2 | Version of Istio |
| CONFIG | values.yaml | Path to values.yaml configuration of Istio | 
