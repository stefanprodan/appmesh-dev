prep:
	./kustomize-prep.sh

sync:
	git add -A && \
    git commit -m "up" && \
    git push origin master && \
    fluxctl sync --k8s-fwd-ns flux
