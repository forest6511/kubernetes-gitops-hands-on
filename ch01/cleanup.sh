#!/bin/bash
set -euo pipefail
echo "Cleaning up Chapter 01 resources..."
kubectl delete -k manifests/ --ignore-not-found
kubectl delete namespace todo-app --ignore-not-found
echo "Done."
