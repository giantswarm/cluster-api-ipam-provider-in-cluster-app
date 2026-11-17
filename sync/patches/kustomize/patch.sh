#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly SCRIPT_DIR
source "${SCRIPT_DIR}"/../../_helpers.sh
SOURCE_DIR="${SCRIPT_DIR}"/tmp/output

# Prep the local working dir
rm -rf "${SCRIPT_DIR}"/tmp
mkdir -p "${SCRIPT_DIR}"/tmp/{input,output}

# Copy the upstream manifest in and split it into individual files
cp "${VENDIR_SYNC_DIR}"/ipam-components.yaml "${SCRIPT_DIR}"/tmp/input/
kustomize build "${SCRIPT_DIR}" -o "${SCRIPT_DIR}"/tmp/output/

# Strip the Kubernetes CRD resource prefix from filenames.
# This is necessary to produce valid names for the downstream Kubernetes resources.
while IFS= read -r -d '' file; do
    filename=$(basename "${file}")
    filename="${filename#apiextensions.k8s.io_v1_customresourcedefinition_}"

    # Move the renamed files to the chart's files dir
    mv -v -- "${file}" "${CHART_DIR}/files/${filename}"
done < <(
    find "${SOURCE_DIR}" -type f \
        -name '*apiextensions.k8s.io_v1_customresourcedefinition*' \
        -print0
)

# Strip the IPAM API group suffix from the relevant CRD filename.
while IFS= read -r -d '' file; do
    directory=$(dirname "${file}")
    filename=$(basename "${file}")
    filename="${filename/.ipam.cluster.x-k8s.io/}"

    mv -v -- "${file}" "${directory}/${filename}"
done < <(
    find "${CHART_DIR}/files" -type f \
        -name '*ipam.cluster.x-k8s.io.yaml' \
        -print0
)

# Wrap all templates generated from the upstream manifest in a conditional
find "${SCRIPT_DIR}"/tmp/output/ -type f -regex ".*\.y[a]*ml" | while read -r f; do
  if ! grep -q "if \.Values\.enabled" "${f}" ; then
    _orig=$(cat "${f}")
    {
      echo "{{- if .Values.enabled }}"
      echo "${_orig}"
      echo "{{- end }}"
    } > "${f}"
  fi
done

# Copy templates to the chart dir
cp "${SCRIPT_DIR}"/tmp/output/* "${CHART_DIR}"/templates/

# Cleanup
rm -rf "${SCRIPT_DIR}"/tmp
