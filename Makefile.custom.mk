##@ App

SHELL := /bin/bash

APPLICATION_NAME="cluster-api-ipam-provider-in-cluster"

UPSTREAM_ORG="kubernetes-sigs"
REPO_NAME="cluster-api-ipam-provider-in-cluster"
TAG_TO_SYNC="v0.1.0-alpha.2"

.PHONY: all
all: fetch-upstream-manifest apply-kustomize-patches apply-custom-patches delete-generated-helm-charts release-manifests ## Builds the manifests to publish with a release (alias to release-manifests)

.PHONY: fetch-upstream-manifest
fetch-upstream-manifest: ## fetch upstream manifest from upstream repo
	./hack/sync-version.sh ${UPSTREAM_ORG} ${REPO_NAME} ${TAG_TO_SYNC}

.PHONY: apply-kustomize-patches
apply-kustomize-patches: ## apply giantswarm specific patches
	kubectl kustomize config/kustomize -o config/kustomize/tmp

.PHONY: apply-custom-patches
apply-custom-patches: ## apply giantswarm specific patches that are not possible via kustomize
	./hack/custom-patches.sh

.PHONY: delete-generated-helm-charts
delete-generated-helm-charts: # clean workspace and delete manifests
	@rm -rvf ./helm/${APPLICATION_NAME}/templates/*.yaml
	@rm -rvf ./helm/${APPLICATION_NAME}/files/*.yaml

.PHONY: release-manifests
release-manifests:
	# move files from workdir over to helm directury structure
	./hack/prepare-helmchart.sh ${APPLICATION_NAME}
