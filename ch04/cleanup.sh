#!/bin/bash
set -euo pipefail
echo "Cleaning up Chapter 04 resources..."
kubectl delete -f 04-alert-rules.yaml --ignore-not-found 2>/dev/null || true
kubectl delete -f 02-servicemonitor.yaml --ignore-not-found 2>/dev/null || true
helm uninstall monitoring -n monitoring 2>/dev/null || true
kubectl delete namespace monitoring --ignore-not-found
echo "Note: CRD (ServiceMonitor等) は helm uninstall では削除されません。"
echo "完全に削除するには: kubectl get crd -o name | grep monitoring.coreos.com | xargs kubectl delete"
echo "Done."
