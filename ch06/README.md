# 第6章: ローカルからEKSへ移行する

「Kubernetes実践ハンズオン」第6章の設定ファイルです。

## 前提条件

- 第5章の EKS クラスターが起動していること
- kubeconfig が EKS クラスターに向いていること

## ⚠️ AWS 課金について

前章と同じ課金が発生します。合計目安: **約$5〜15/日**

ハンズオンが終わったら、必ずクリーンアップを実行してください。

## ファイル構成

| ファイル | 種別 | 説明 |
|---------|------|------|
| 01-storageclass.yaml | StorageClass | EBS gp3 StorageClass（デフォルト設定） |
| 02-gateway.yaml | GatewayClass / Gateway / HTTPRoute | AWS ALB 向け Gateway API 設定 |

## 適用手順

1. `kubectl apply -f 01-storageclass.yaml`
2. `kubectl apply -f 02-gateway.yaml`
3. `kubectl apply -k ../manifests/`（アプリケーションマニフェスト）
4. `kubectl get gateway -n todo-app`（ALB の DNS 名を確認）

## クリーンアップ

```bash
bash cleanup.sh
```
