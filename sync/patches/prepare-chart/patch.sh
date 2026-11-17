#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) ; readonly SCRIPT_DIR
source "${SCRIPT_DIR}"/../../_helpers.sh

# Remove the existing helm chart
rm -rf "${CHART_DIR}" || true

# Create the template dir
mkdir -p "${CHART_DIR}"/templates

# Create the CRD install template dir
mkdir -p "${CRD_INSTALL_DIR}"

# Create the files dir to hold the CRDs
mkdir -p "${CHART_DIR}"/files

