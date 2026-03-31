#!/bin/bash
set -euo pipefail
echo "Cleaning up Chapter 07 resources..."
kubectl delete -f 03-network-policy.yaml --ignore-not-found 2>/dev/null || true
kubectl delete -f 02-rbac.yaml --ignore-not-found 2>/dev/null || true
kubectl delete -f 01-hpa.yaml --ignore-not-found 2>/dev/null || true
kubectl label namespace todo-app \
  pod-security.kubernetes.io/enforce- \
  pod-security.kubernetes.io/warn- \
  2>/dev/null || true
echo "Done."
