# 第1章: Vol.2の出発点を作る

「Kubernetes実践ハンズオン」第1章の設定ファイルです。

## 前提条件

- minikube が起動していること（`minikube status`）
- Docker Hub アカウントを持っていること

## ファイル構成

| ファイル | 種別 | 説明 |
|---------|------|------|
| 01-configmap.yaml | ConfigMap | データベース名の設定 |
| 02-secret.yaml | Secret | データベース認証情報 |
| 03-pvc.yaml | PersistentVolumeClaim | データベースデータの永続化 |
| 04-deployment.yaml | Deployment | API・フロントエンド・DBの3コンポーネント |
| 05-service.yaml | Service | API・フロントエンド・DBのService定義 |
| 06-kustomization.yaml | Kustomization | リソースの一括管理 |

## 適用手順

```bash
kubectl create namespace todo-app
kubectl apply -k manifests/
```

## クリーンアップ

```bash
bash cleanup.sh
```
