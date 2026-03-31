# 第3章: ArgoCDでGitOpsを実現する

「Kubernetes実践ハンズオン」第3章の設定ファイルです。

## 前提条件

- 第2章まで完了していること
- minikube が起動していること
- ArgoCD がインストール済みであること

## ファイル構成

| ファイル | 種別 | 説明 |
|---------|------|------|
| 01-todo-app-application.yaml | ArgoCD Application | Todo アプリの宣言的デプロイ定義（自動同期・prune・selfHeal有効） |

## 適用手順

1. `kubectl apply -f 01-todo-app-application.yaml`
2. `argocd app get todo-app` で同期状態を確認

## クリーンアップ

```bash
bash cleanup.sh
```
