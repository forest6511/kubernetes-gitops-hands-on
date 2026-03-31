#!/bin/bash
set -euo pipefail
echo "Cleaning up Chapter 03 resources..."
argocd app delete todo-app --cascade --yes 2>/dev/null || \
  kubectl delete application todo-app -n argocd --ignore-not-found
echo "ArgoCD Application を削除しました。管理していた K8s リソースも自動的に削除されます。"
echo "Done."
