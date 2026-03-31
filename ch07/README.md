# 第7章: 本番運用の基礎

「Kubernetes実践ハンズオン」第7章の設定ファイルです。

## 前提条件

- 第6章まで完了していること
- minikube または EKS クラスターが利用可能であること

## ファイル構成

| ファイル | 種別 | 説明 |
|---------|------|------|
| 01-hpa.yaml | HorizontalPodAutoscaler | CPU 70% 閾値、2〜10 レプリカの自動スケーリング |
| 02-rbac.yaml | Role / RoleBinding | todo-app Namespace の閲覧専用権限 |
| 03-network-policy.yaml | NetworkPolicy | デフォルト Deny + frontend→api→db の通信許可 |

## 適用手順

1. `kubectl apply -f 01-hpa.yaml`
2. `kubectl apply -f 02-rbac.yaml`
3. `kubectl apply -f 03-network-policy.yaml`
4. PSS ラベルの適用: `kubectl label namespace todo-app pod-security.kubernetes.io/enforce=restricted pod-security.kubernetes.io/warn=restricted --overwrite`

## クリーンアップ

```bash
bash cleanup.sh
```
