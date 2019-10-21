#!/usr/bin/env bash

set -o errexit

REPO_ROOT=$(git rev-parse --show-toplevel)

cd base && kustomize create --autodetect --recursive && cd ..
cd flux && kustomize create --autodetect --recursive && cd ..

cat <<EOF > kustomization.yaml
  apiVersion: kustomize.config.k8s.io/v1beta1
  kind: Kustomization
  bases:
    - base
    - flux
EOF

cat <<EOF > .flux.yaml
  version: 1
  commandUpdated:
    generators:
      - command: kustomize build .
EOF