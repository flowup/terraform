#!/bin/bash -x

# Improvement: running this script in Docker with preinstalled dependencies - gcloud, kubectl, helm

set -e
export INSTALL_TMP=/tmp/istio-install
mkdir -p $INSTALL_TMP && cd $INSTALL_TMP

gcloud container clusters get-credentials ${name} --zone ${zone}

kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud config get-value core/account)

# Download Istio
wget https://github.com/istio/istio/releases/download/${istio_version}/istio-${istio_version}-linux.tar.gz
tar xzf istio-${istio_version}-linux.tar.gz

# Install Helm
wget -P $INSTALL_TMP/helm/ https://storage.googleapis.com/kubernetes-helm/helm-v2.9.1-linux-amd64.tar.gz
tar xf $INSTALL_TMP/helm/helm-v2.9.1-linux-amd64.tar.gz -C $INSTALL_TMP/helm/
export PATH="$PATH:$INSTALL_TMP/istio-${istio_version}/bin::$INSTALL_TMP/helm/linux-amd64/"
kubectl apply -f $INSTALL_TMP/istio-${istio_version}/install/kubernetes/helm/helm-service-account.yaml
helm init --service-account tiller && sleep 30

ISTIO_OPTIONS=" --set global.proxy.image=proxyv2 "
ISTIO_OPTIONS=$ISTIO_OPTIONS" --set sidecar-injector.enabled=true"
ISTIO_OPTIONS=$ISTIO_OPTIONS" --set global.mtls.enabled=${mtls_enabled}"
ISTIO_OPTIONS=$ISTIO_OPTIONS" --set grafana.enabled=true"
ISTIO_OPTIONS=$ISTIO_OPTIONS" --set prometheus.enabled=true"
ISTIO_OPTIONS=$ISTIO_OPTIONS" --set tracing.enabled=true"
ISTIO_OPTIONS=$ISTIO_OPTIONS" --set servicegraph.enabled=true"
ISTIO_OPTIONS=$ISTIO_OPTIONS" --set certmanager.enabled=${certmanager_enabled}"

kubectl create ns istio-system
helm template --name istio --namespace istio-system $ISTIO_OPTIONS $INSTALL_TMP/istio-${istio_version}/install/kubernetes/helm/istio > istio_config.yaml
kubectl apply -f istio_config.yaml
kubectl label namespace default istio-injection=enabled

rm -rf $INSTALL_TMP