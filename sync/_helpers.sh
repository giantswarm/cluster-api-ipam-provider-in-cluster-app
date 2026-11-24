# file has no shebang so shellcheck needs to be told
# shellcheck shell=bash
# stop shellcheck complaining about unused variables
# shellcheck disable=SC2034

# root dir of the git repository
REPO_DIR=$(git rev-parse --show-toplevel) ; readonly REPO_DIR

SCRIPT_DIR_REL=".${SCRIPT_DIR#"${REPO_DIR}"}" ; readonly SCRIPT_DIR

# root dir of the generated helm chart
CHART_DIR="${REPO_DIR}"/helm/cluster-api-ipam-provider-in-cluster ; readonly CHART_DIR

# root dir of the vendir synced chart
VENDIR_SYNC_DIR="${REPO_DIR}"/vendor/cluster-api-ipam-provider-in-cluster ; readonly VENDIR_SYNC_DIR

# values.yaml in chart dir
VALUES_YAML="${CHART_DIR}"/values.yaml ; readonly VALUES_YAML

# Chart.yaml in chart dir
CHART_YAML="${CHART_DIR}"/Chart.yaml ; readonly CHART_YAML

# root dir of the CRD dependency chart
CRD_CHART_DIR="${CHART_DIR}/charts/cluster-api-ipam-provider-in-cluster-crds" ; readonly CRD_CHART_DIR
