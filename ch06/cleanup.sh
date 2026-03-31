#!/bin/bash
set -euo pipefail
echo "⚠️  EKS リソースを削除します。"
echo "Cleaning up Chapter 06 resources..."

# Gateway（ALB）を先に削除
kubectl delete gateway todo-gateway -n todo-app --ignore-not-found
echo "ALB の削除を待機中...（1〜2分）"
sleep 30

# アプリケーションリソースの削除
kubectl delete -k ../manifests/ --ignore-not-found 2>/dev/null || true

# ArgoCD の削除
kubectl delete namespace argocd --ignore-not-found 2>/dev/null || true

# 監視スタックの削除
helm uninstall monitoring -n monitoring 2>/dev/null || true
kubectl delete namespace monitoring --ignore-not-found 2>/dev/null || true

# AWS LBC の削除
helm uninstall aws-load-balancer-controller -n kube-system 2>/dev/null || true

echo ""
echo "リソースを削除しました。"
echo "クラスター自体の削除は ch05/cleanup.sh を実行してください。"
echo "Done."
