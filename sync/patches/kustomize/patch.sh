#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly SCRIPT_DIR
source "${SCRIPT_DIR}"/../../_helpers.sh
OUTPUT_DIR="${SCRIPT_DIR}"/tmp/output

mkdir -p "${OUTPUT_DIR}" || true

# Split the upstream manifest into individual files.
kustomize build "${SCRIPT_DIR}" -o "${OUTPUT_DIR}"

# Find CRDs and move them to the crds patch directory.
grep -rlZ '^kind: CustomResourceDefinition$' "${OUTPUT_DIR}" \
    | xargs -0 -I {} mv -v -- {} "${REPO_DIR}/sync/patches/crds/tmp/"

# Wrap all templates generated from the upstream manifest in a conditional
find "${OUTPUT_DIR}" -type f -regex ".*\.y[a]*ml" | while read -r f; do
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
cp "${OUTPUT_DIR}"/* "${CHART_DIR}"/templates/

# Cleanup
rm -rf "${SCRIPT_DIR}"/tmp
