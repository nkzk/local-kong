kind:
	ctlptl apply -f local/kind-cluster.yaml
kind-destroy:
	ctlptl delete -f local/kind-cluster.yaml
kong:
	./local/install-kong.sh
argo:
	./local/install-argo.sh
kong-upgrade:
	helm upgrade kong kong/kong  -n kong -f ./local/kong-values.yaml
destroy: kind-destroy
example-service: 
	kubectl apply -f ./local/test-service.yaml