projeto Hello para testes

comando de port-forward para o tekton dashboard
kubectl port-forward -n tekton-pipelines service/tekton-dashboard 9097:9097

oc adm policy add-scc-to-user privileged -z build-bot -n hello

oc apply -f ./secrets/
