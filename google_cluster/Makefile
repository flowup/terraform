CLUSTER=test
ZONE=europe-west1-d
CLUSTER_USER=$(shell gcloud config get-value core/account)

VERSION_HELM=2.10.0
VERSION_ISTIO=1.0.2

INSTALL_TMP=/tmp/cluster_init

install: init cluster/auth install/helm install/istio

install/helm:
	export PATH="$PATH:${INSTALL_TMP}/helm/linux-amd64/"
	kubectl apply -f ${INSTALL_TMP}/istio/istio-${VERSION_ISTIO}/install/kubernetes/helm/helm-service-account.yaml
	helm init --service-account tiller && sleep 30

install/istio:
	kubectl create ns istio-system
	helm template -n istio --namespace istio-system -f ${INSTALL_TMP}/istio/istio-${VERSION_ISTIO}/install/kubernetes/helm/istio/values.yaml -f values.yaml ${INSTALL_TMP}/istio/istio-${VERSION_ISTIO}/install/kubernetes/helm/istio > ${INSTALL_TMP}/istio_config.yaml
	kubectl apply -f ${INSTALL_TMP}/istio_config.yaml
	kubectl label namespace default istio-injection=enabled

cluster/auth:
	gcloud container clusters get-credentials ${CLUSTER} --zone ${ZONE}
	kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=${CLUSTER_USER}

init:
	mkdir -p ${INSTALL_TMP}
	wget -P ${INSTALL_TMP}/istio/ https://github.com/istio/istio/releases/download/${VERSION_ISTIO}/istio-${VERSION_ISTIO}-linux.tar.gz
	tar xzf ${INSTALL_TMP}/istio/istio-${VERSION_ISTIO}-linux.tar.gz -C ${INSTALL_TMP}/istio/
	wget -P ${INSTALL_TMP}/helm/ https://storage.googleapis.com/kubernetes-helm/helm-v${VERSION_HELM}-linux-amd64.tar.gz
	tar xf ${INSTALL_TMP}/helm/helm-v${VERSION_HELM}-linux-amd64.tar.gz -C ${INSTALL_TMP}/helm/

cleanup:
	rm -rf ${INSTALL_TMP}