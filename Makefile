prep:
	./kustomize-prep.sh

sync:
	git add -A && \
    git commit -m "up" && \
    git push origin master && \
    fluxctl sync --k8s-fwd-ns flux

logs:
	kubectl -n appmesh-system logs deploy/appmesh-controller
	kubectl -n appmesh-system logs deploy/flagger | jq .msg