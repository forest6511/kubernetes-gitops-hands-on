# 第5章: Amazon EKSでクラスターを作る

「Kubernetes実践ハンズオン」第5章の設定ファイルです。

## 前提条件

- 第4章まで完了していること
- AWS アカウントと AWS CLI v2 がインストール済みであること
- eksctl がインストール済みであること

## ⚠️ AWS 課金について

**EKS は AWS 無料枠の対象外です。**

- EKS クラスター: $0.10/時（約$2.40/日）
- EC2 ノード（t3.medium x2）: 約$2.50/日
- 合計目安: **約$5〜15/日**

ハンズオンが終わったら、必ずクリーンアップを実行してください。

## ファイル構成

| ファイル | 種別 | 説明 |
|---------|------|------|
| 01-cluster-config.yaml | eksctl ClusterConfig | EKS クラスター定義（t3.medium x2、東京リージョン） |

## 適用手順

1. `eksctl create cluster -f 01-cluster-config.yaml --dry-run`（事前確認）
2. `eksctl create cluster -f 01-cluster-config.yaml`（クラスター作成、15〜25分）

## クリーンアップ

```bash
bash cleanup.sh
```
