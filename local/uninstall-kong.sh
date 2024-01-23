#!/bin/bash
if [[ $(kubectl config current-context) -eq "kind-kind" ]]
then
    helm uninstall kong -n kong
else
    echo "Not in KIND context! Exiting"
fi