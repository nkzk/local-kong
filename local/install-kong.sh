#!/bin/bash
if [[ $(kubectl config current-context) -eq "kind-kind" ]]
then
    helm repo add kong https://charts.konghq.com
    helm repo update
    helm install kong/kong --name-template kong --version 2.34.0 -n kong --create-namespace  -f ./local/kong-values.yaml
    echo "Waiting for kong-pod to be ready...(Press Ctrl+C to cancel - Kong will get ready in the background)"
    kubectl wait --namespace kong \
      --for=condition=ready pod \
      --selector=app.kubernetes.io/instance=kong \
      --timeout=90s
else
    echo "Not in KIND context! Exiting"
fi