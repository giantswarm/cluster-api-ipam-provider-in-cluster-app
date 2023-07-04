#!/bin/bash
set -euo pipefail

find helm/cluster-api-ipam-provider-in-cluster/templates/ -type f -regex ".*\.y[a]*ml" | while read f; do
  if ! grep -q "if \.Values\.enabled" "${f}" ; then
    _orig=$(cat "${f}")
    {
      echo "{{- if .Values.enabled }}"
      echo "${_orig}"
      echo "{{- end }}"
    } > "${f}"
  fi
done