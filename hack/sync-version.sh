#!/bin/bash

set -euo pipefail


cd "$(dirname "${0}")"
UPSTREAM_ORG="${1}"
REPO_NAME="${2}"
TAG="${3}"

# create a temporary directory and checkout CAIP there
TMPDIR=$(mktemp -d)
pushd "${TMPDIR}"

git clone --depth=1 --branch "${TAG}" "https://github.com/${UPSTREAM_ORG}/${REPO_NAME}.git"
pushd "${REPO_NAME}"
make release-manifests

# remove ${REPO_NAME} from the stack
popd

# remove $TMPDIR from the stack
popd

# copy upstream generated release-manifests into downstream repo
cp -v "${TMPDIR}/${REPO_NAME}/out/ipam-components.yaml" "../config/kustomize/input/"
